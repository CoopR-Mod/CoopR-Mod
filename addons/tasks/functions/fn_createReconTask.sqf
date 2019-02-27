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
    private _taskStatus = false;
    private _taskId = format ["coopr_task_recon_%1", count COOPR_RECON_TASKS];

    _taskStatus = [_unit, [_taskId], "CoopR_Task_Recon", _reconDestination, 1, 2, true] call BIS_fnc_taskCreate;

    if (_taskStatus isEqualTo false) then {
        ["||CoopR|| There are no demands for recon operations at the moment"] remoteExec ["systemChat", _unit];
    } else {
        ["||CoopR|| HQ wants you to recon the objective area and report enemy activity!"] remoteExec ["systemChat", _unit];
        _unit call coopr_fnc_initTaskTracker;
        _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskId, true];
        [_reconDestination, _taskId, "RECON"] call coopr_fnc_createTaskMarker;

        COOPR_RECON_TASKS pushBack _taskId;
    };
} else {
    SERVER_ONLY_ERROR;
}

