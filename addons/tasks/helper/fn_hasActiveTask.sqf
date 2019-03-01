#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This helper will just check if a player has an active coopr task assigned
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _hasTask <BOOLEAN>: if the player has an active coopr task
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_player", objNull]];

if (_player isEqualTo "") exitWith { ERROR("_player was empty string") };
if !(isPlayer _player) exitWith { ERROR("_player is not a player") };

private _currentTask = _player getVariable [COOPR_KEY_ACTIVE_TASK, []];

// return boolean
_currentTask isEqualTo [];
