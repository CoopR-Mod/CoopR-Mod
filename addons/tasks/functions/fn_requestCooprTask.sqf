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

[player, _cooprTask] remoteExec ["coopr_fnc_createCooprTask"];
closeDialog GUI_ID_TASKBOARD_DIALOG;
