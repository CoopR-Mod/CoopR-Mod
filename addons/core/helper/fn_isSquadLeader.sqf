#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Checks if the player is a squad leader.
 * 
 *
 * Arguments:
 * _player - OBJECT, the unit/player we want to check.
 *
 * Return Value:
 * _isSquadleader <BOOLEAN>: if the player is a squad leader or not.
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_player", objNull]];

private _characterRole = player getVariable [COOPR_KEY_ROLE, COOPR_ROLE_LEADER ];
if!(_characterRole isEqualTo COOPR_ROLE_LEADER) exitWith {false};
true;