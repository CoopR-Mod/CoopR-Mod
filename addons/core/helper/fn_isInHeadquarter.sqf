#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine is run at the given timing if the player/squad is within the headquarters boundaries
 * Routine timer: COOPR_TIMER_HQ_ROUTINE
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

private _isLoggedIn = _player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];

// return boolean
_player inArea COOPR_HQ_WEST_BOUNDS and _isLoggedIn;


