#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Checks if the player is a player is within the coopr headquarter bounds and is actually a logged in
 * player character
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _isInHeadquarter <BOOLEAN>: if the player is within the headquarter bounds
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_player", objNull]];

if (_player isEqualTo "") exitWith { ERROR("_player was empty string") };
if !(isPlayer _player) exitWith { ERROR("_player is not a player") };

private _isLoggedIn = _player getVariable [COOPR_CHAR_PLAYER_LOGGEDIN, false];

// return boolean
_player inArea COOPR_HQ_WEST_BOUNDS and _isLoggedIn;


