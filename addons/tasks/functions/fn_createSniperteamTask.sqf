#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR sniperteam task that applied to the whole group of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _cooprTaskInfo <ARRAY/CBA_HASH> - coopr task containing all infos needed to create a task
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [player, ] call coopr_fnc_createSniperteamTask;
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

    DEBUG2("task position: %1", _location);
    private _taskName = format ["coopr_task_sniperteam_%1", COOPR_STATS_TASK_SNIPERTEAM];
    private _taskResult = [_unit, _taskName , [_description, "Sniper Team"], _location, 1, 2, true] call BIS_fnc_taskCreate;

    if (_taskResult isEqualTo true) then {
        DEBUG("sniper team task assigned");
        [COOPR_TASK_TYPE_SNIPERTEAM] remoteExec ["coopr_fnc_countTask"];
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskName, true];
        _taskResult;
    };
}
