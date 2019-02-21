#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR sniperteam task that is applied to the whole group of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _cooprTaskInfo <ARRAY/CBA_HASH> - coopr task containing all infos needed to create a task
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [_unit, _cooprTaskInfo] call coopr_fnc_createSniperteamTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_cooprTaskInfo", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_cooprTaskInfo isEqualTo []) exitWith { ERROR("_cooprTaskInfo was []") };

if (isServer) then {
    DEBUG2("assigning sniper team task to unit %1", _unit);
    private _location = [_cooprTaskInfo, COOPR_KEY_TASK_LOCATION] call CBA_fnc_hashGet;
    private _description = [_cooprTaskInfo, COOPR_KEY_TASK_DESCRIPTION] call CBA_fnc_hashGet;
    private _target = [_cooprTaskInfo, COOPR_KEY_TASK_TARGET] call CBA_fnc_hashGet;

    DEBUG2("task position: %1", _location);
    private _taskName = format ["coopr_task_sniperteam_%1", [COOPR_COUNTER_TASKS, COOPR_TASK_TYPE_SNIPERTEAM] call CBA_fnc_hashGet];
    private _creationSuccess = [_unit, _taskName , [_description, "Sniper Team"], _location, 1, 2, true] call BIS_fnc_taskCreate;

    if (_creationSuccess isEqualTo true) then {
        private _taskTracker = EMPTY_HASH;

        // init task tracker
        [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, -1] call CBA_fnc_hashSet;
        [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, -1] call CBA_fnc_hashSet;
        [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, -1] call CBA_fnc_hashSet;
        [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, -1] call CBA_fnc_hashSet;

        DEBUG("sniper team task assigned");
        [COOPR_TASK_TYPE_SNIPERTEAM] remoteExec ["coopr_fnc_countTask"];
        // TODO: need to be shifted to group/squads
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskName, true];
        _unit setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
        _creationSuccess;
    } else {
        ERROR("could not assign task.");
        _creationSuccess;
    };

} else {
    ERROR("this function can only be executed on the server side")
    ;
};
