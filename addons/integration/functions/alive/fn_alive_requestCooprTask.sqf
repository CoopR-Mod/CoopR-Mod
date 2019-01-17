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

if (count COOPR_TASKS <= 0 ) then {
    INFO("no coopr tasks found. Create a new recon task");

    if (INTEGRATE_ALIVE) then {
        [player] remoteExec ["coopr_fnc_alive_createReconTask", EXEC_SERVER];
    };

} else {
    private _cooprTask = COOPR_TASKS deleteAt 0;
    DEBUG2("coopr task: %1", _cooprTask);
    private _taskType = [_cooprTask, COOPR_KEY_TASK_TYPE] call CBA_fnc_hashGet;
    DEBUG2("task type: %1", _taskType);

    if (_taskType isEqualTo COOPR_TASK_TYPE_SNIPERTEAM) then {
        [player, _cooprTask] call coopr_fnc_createSniperteamTask;
    };
};
