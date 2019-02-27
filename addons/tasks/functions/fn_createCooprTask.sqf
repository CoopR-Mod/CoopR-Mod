#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR task that is applied to the whole group of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _taskType <STRING> - task type identifier string
 * 2: _cooprTaskInfo <ARRAY/CBA_HASH> - coopr task containing all infos needed to create a task
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [_unit, "coopr_task_type_assault", _cooprTaskInfo] call coopr_fnc_createCooprTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_taskType", ""],
        ["_cooprTaskInfo", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_taskType isEqualTo "") exitWith { ERROR("_taskType was empty string") };
if (_cooprTaskInfo isEqualTo []) exitWith { ERROR("_cooprTaskInfo was []") };

if (isServer) then {
    DEBUG3("assigning %1 to unit %2", _taskType, _unit);
    private _destination = [_cooprTaskInfo, COOPR_KEY_TASK_LOCATION] call CBA_fnc_hashGet;
    private _description = [_cooprTaskInfo, COOPR_KEY_TASK_DESCRIPTION] call CBA_fnc_hashGet;
    private _target = [_cooprTaskInfo, COOPR_KEY_TASK_TARGET] call CBA_fnc_hashGet;

    DEBUG2("task position: %1", _destination);
    private _taskAmount = [COOPR_COUNTER_TASKS, _taskType] call CBA_fnc_hashGet;
    private _taskId = format ["%1_%2", _taskType, _taskAmount];
    private _creationSuccess = [_unit, _taskId , [_description, "task assigned"], _destination, 1, 2, true] call BIS_fnc_taskCreate;

    DEBUG2("task creation success: %1", _creationSuccess);
    if (_creationSuccess isEqualTo true) then {
        _unit call coopr_fnc_initTaskTracker;
        DEBUG2("%1 assigned", _taskType);
        [_taskType] remoteExec ["coopr_fnc_countTask"];
        // TODO: need to be shifted to group/squads
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskId, true];
        [_destination, _taskId, "OTHER"] call coopr_fnc_createTaskMarker;
        _creationSuccess;
    } else {
        ERROR("could not assign task.");
        _creationSuccess;
    };

} else {
    SERVER_ONLY_ERROR;
};
