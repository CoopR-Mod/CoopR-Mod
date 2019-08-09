#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR Mission. If no attack missions/missions are available this will create a recon mission to get intel of enemy
 * positions.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestCooprMission;
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_cooprMission", []]];
if (_cooprMission isEqualTo []) exitWith { ERROR("_cooprMission was undefined") };

private _id = [_cooprMission, COOPR_KEY_MISSION_QUEUE_ID] call CBA_fnc_hashGet;
[_id] remoteExec ["coopr_fnc_deleteQueuedMission", EXEC_SERVER];

[player, _cooprMission] remoteExec ["coopr_fnc_createCooprMission", EXEC_SERVER];
closeDialog GUI_ID_MISSIONBOARD_DIALOG;
