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

params [["_indexOfMission", -1]];

if (_indexOfMission isEqualTo -1) exitWith { ERROR("_indexOfMission was not defined") };

private _cooprTaskInfo = COOPR_TASKS_QUEUE deleteAt _indexOfMission;
DEBUG2("info %1", _cooprTaskInfo);
[player, _cooprTaskInfo] remoteExec ["coopr_fnc_createCooprTask"];

closeDialog GUI_ID_TASKBOARD_DIALOG;
