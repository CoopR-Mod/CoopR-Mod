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

params [["_cooprTask", []]];
if (_cooprTask isEqualTo []) exitWith { ERROR("_cooprTask was undefined") };

private _id = [_cooprTask, COOPR_KEY_TASK_QUEUE_ID] call CBA_fnc_hashGet;
[_id] remoteExec ["coopr_fnc_deleteQueuedTask", EXEC_SERVER];

[player, _cooprTask] remoteExec ["coopr_fnc_createCooprTask", EXEC_SERVER];
closeDialog GUI_ID_TASKBOARD_DIALOG;
