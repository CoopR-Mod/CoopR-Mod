#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates the CoopR state of a player unit. This is used for preparation of persisting the player state
 *
 * Arguments:
 * 1: _character <OBJECT> - character / player object
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_updateState
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_character", objNull]];

if(_character isEqualTo objNull) exitWith { ERROR("given _character object was null") };

DEBUG("updating character state");
player setVariable [COOPR_CHAR_POSITION, getPos player, true];
player setVariable [COOPR_CHAR_LOADOUT, getUnitLoadout player, true];
