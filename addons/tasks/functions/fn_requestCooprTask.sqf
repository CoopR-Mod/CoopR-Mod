#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR Task. If no attack missions/tasks are available this will create a recon task to get intel of enemy
 * positions.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestCooprTask;
 *
 * Public: No
 *
 * Scope: Client
 */

if (count COOPR_TASKS_QUEUE <= 0 ) then {
    INFO("no coopr tasks found. Create a new recon task");

    if (INTEGRATE_ALIVE) then {
        private _lowestPrioObjective = ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;

        // check for another objective type
        if (_lowestPrioObjective isEqualTo objNull) then {
            _lowestPrioObjective = ["WEST", "attack"] call coopr_fnc_alive_getLowestPriorityObjective;
        };

        if (not (_lowestPrioObjective isEqualTo objNull)) then {
            private _positionOfObjective = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
            [player, _positionOfObjective] remoteExec ["coopr_fnc_alive_createReconTask", EXEC_SERVER];
        } else {
            ["||CoopR|| No objectives available at the moment"] remoteExec ["systemChat", _unit];
        };
    } else {
        // TODO call recon task for coopr or other integration
    };

} else {
    private _cooprTaskInfo = COOPR_TASKS_QUEUE deleteAt 0;
    private _taskType = [_cooprTaskInfo, COOPR_KEY_TASK_TYPE] call CBA_fnc_hashGet;
    [player, _taskType, _cooprTaskInfo] remoteExec ["coopr_fnc_createCooprTask"];
};
