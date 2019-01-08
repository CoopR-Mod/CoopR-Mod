#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Integrates with ALiVE and calls their task request systems
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestMinorSupportTask;
 *
 * Public: No
 *
 * Scope: Client
 */

private _lowestPrioObjective = ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;
private _positionOfObjective = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
private _objectiveSize = [_lowestPrioObjective, "size"] call alive_fnc_hashGet;
private _enemySide = "EAST";
private _targets = [_positionOfObjective, _objectiveSize, [_enemySide,"entity"], true] call ALIVE_fnc_getNearProfiles;

["WEST","BWA3_Faction_Fleck","DestroyInfantry", _targets, getPlayerUID player, false] call ALiVE_fnc_taskRequest;

systemChat "||CoopR|| Support our allies at this minor attack objective";

