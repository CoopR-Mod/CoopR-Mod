#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR recon task that applied to the whole group of a given unit. This is integrated with ALiVE. Therefore
 * it will automatically assign a opcoms low prio objective as next recon target location.
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [_unit] call coopr_fnc_alive_createReconTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _lowestPrioObjective = ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;

    // check for another objective type
    if (_lowestPrioObjective isEqualTo objNull) then {
        _lowestPrioObjective = ["WEST", "attack"] call coopr_fnc_alive_getLowestPriorityObjective;
    };

    if (not (_lowestPrioObjective isEqualTo objNull)) then {
        private _positionOfObjective = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
        private _objectiveSize = [_lowestPrioObjective, "size"] call alive_fnc_hashGet;
        private _enemySide = "EAST";
        private _taskStatus = false;
        private _taskName = format ["coopr_task_recon_%1", count COOPR_RECON_TASKS];

        _taskStatus = [_unit, [_taskName], "CoopR_Task_Recon", _positionOfObjective, 1, 2, true] call BIS_fnc_taskCreate;

        if (_taskStatus isEqualTo false) then {
            ["||CoopR|| There are no demands for recon operations at the moment"] remoteExec ["systemChat", _unit];
        } else {
            ["||CoopR|| HQ wants you to recon the objective area and report enemy activity!"] remoteExec ["systemChat", _unit];
            _unit setVariable [COOPR_KEY_ACTIVE_TASK, _taskName, true];
            COOPR_RECON_TASKS pushBack _taskName;
        };

    } else {
        ["||CoopR|| No objectives available at the moment"] remoteExec ["systemChat", _unit];
    };
}

