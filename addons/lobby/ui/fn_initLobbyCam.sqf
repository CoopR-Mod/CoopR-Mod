#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will setup the lobby cam
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

private _agentPos = getPos COOPR_LOBBY_AGENT;
private _lobbyPos = getPos COOPR_LOBBY;
private _offset = 4.2;
private _agentPosModified = [_agentPos select 0, _agentPos select 1, (_agentPos select 2) + 1.5];
private _camPos = [(_lobbyPos select 0), (_lobbyPos select 1) + _offset, 1.5];
COOPR_LOBBY_CAM = "camera" camCreate _camPos;
COOPR_LOBBY_CAM camSetDir (_camPos vectorFromTo _agentPosModified);
COOPR_LOBBY_CAM cameraEffect ["External", "FRONT"];
COOPR_LOBBY_CAM camSetFocus [-1, -1];
COOPR_LOBBY_CAM camCommit 0;
showCinemaBorder false;
