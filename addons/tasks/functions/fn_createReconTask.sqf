#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR recon task that applied to the whole group of a given unit.
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _reconDestination <LOCATION> - unit this task is assigned to
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [_unit, _reconDestination] call coopr_fnc_createReconTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_reconDestination", locationNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_reconDestination isEqualTo locationNull) exitWith { ERROR("_reconDestination was locationNull") };

if (isServer) then {
    // TODO: replace with task counter function
    private _taskType = "coopr_task_recon";
    private _subTaskType = "coopr_subtask_recon";
    private _taskCount = [COOPR_COUNTER_TASKS, _taskType] call CBA_fnc_hashGet;
    private _taskId = format ["%1_%2", _taskType, _taskCount];
    private _subtaskId = format ["%1_%2", _subTaskType, _taskCount];

    private _reconTaskId = [_unit, [_taskId], "CoopR_Task_Recon", _reconDestination, 1, 2, true] call BIS_fnc_taskCreate;
    [_unit, [_subtaskId, _reconTaskId], "CoopR_Subtask_Recon", _reconDestination, 1, 2, true] call BIS_fnc_taskCreate;

    if !(isNil "_reconTaskId") then {
        DEBUG2("%1 assigned", _reconTaskId);
        [_taskType] call coopr_fnc_countTask;
        [_unit, "coopr_task_recon"] call coopr_fnc_initTaskTracker;
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskId, true];
        [_reconDestination, _taskId, "RECON"] call coopr_fnc_createTaskMarker;

        COOPR_RECON_TASKS pushBack _taskId;
    } else {
        ERROR("could not assign task.");
        false;
    };
} else {
    SERVER_ONLY_ERROR;
}

