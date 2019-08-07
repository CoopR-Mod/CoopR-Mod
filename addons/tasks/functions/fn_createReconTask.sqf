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
    private _taskType = "coopr_task_recon";
    private _taskId = format ["%1_%2", _taskType, (call coopr_fnc_getTaskCount) + 1];
    private _reconTask = [_unit, [_taskId], "CoopR_Task_Recon", [], 1, 2, true] call BIS_fnc_taskCreate;

    if !(isNil "_reconTask") then {
        DEBUG2("%1 assigned", _reconTask);
        [_unit, "coopr_task_recon"] call coopr_fnc_initTaskTracker;
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskId, true];
        [_reconDestination, _taskId, "RECON"] call coopr_fnc_createTaskMarker;
        [(_taskId call coopr_fnc_serializeTask)] spawn coopr_fnc_saveTask;
        private _characterID = _unit getVariable [COOPR_KEY_CHARACTER_ID, -1];
        [_characterID, _taskId] call coopr_fnc_initReconReport;
        _unit setVariable [COOPR_KEY_IN_RECON, true, true];
        COOPR_RECON_ROUTINE_TOGGLE = true;
        true;
    } else {
        ERROR("could not assign task.");
        false;
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
}

