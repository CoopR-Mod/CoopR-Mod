#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This helper will just check if a player has an active coopr mission assigned
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _hasMission <BOOLEAN>: if the player has an active coopr mission
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_player", objNull]];

if (_player isEqualTo objNull) exitWith { ERROR("_player was objNull") };
if !(isPlayer _player) exitWith { ERROR("_player is not a player") };

private _currentMission = _player getVariable [COOPR_CHAR_ACTIVE_MISSION, []];

// return boolean
!(_currentMission isEqualTo [])
