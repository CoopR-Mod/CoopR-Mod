#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Will simply complete the actual recon subtask and create/notify the optional subtask
 *
 * Arguments:
 * 0: _unit <OBJECT> - The unit the optional recon task should be completed of
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call coopr_fnc_completeReconSubtask
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _currentTask = _unit getVariable [COOPR_KEY_ACTIVE_TASK, []];
    private _subTasks = _currentTask call BIS_fnc_taskChildren;
    { [_x, "SUCCEEDED"] call BIS_fnc_taskSetState } forEach _subTasks;
    private _subtaskId = format ["coopr_subtask_optional_recon_%1", count COOPR_RECON_TASKS];
    [_unit, [_subtaskId, _currentTask], "CoopR_Subtask_Optional_Recon", _reconDestination, 1, 2, true] call BIS_fnc_taskCreate;

    private _taskTracker = _unit getVariable [COOPR_KEY_TASK_TRACKER, []];
} else {
    SERVER_ONLY_ERROR;
};
