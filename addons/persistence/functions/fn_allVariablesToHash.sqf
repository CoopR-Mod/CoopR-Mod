#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Convert all variables of a character (player) object into a CBA hash.
 * This function is used to map the player/character state to i.e. push it into
 * the persistence layer (extDB3/CoopR HQ)
 *
 * Arguments:
 * 0: _character <OBJECT> - character to convert all variables from
 *
 * Return Value:
 * CBA_Hash <ARRAY>
 *
 * Example:
 * player call coopr_fnc_allVariablesToHash
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_character", objNull]];

if(_character isEqualTo objNull) exitWith { ERROR("given _character object was null") };

INFO("start mapping character variables to hash");
DEBUG2("character object is %1", _character);
private _variableKeys = allVariables player;
private _hash = EMPTY_HASH;

{
    private _value = _character getVariable _x;
    DEBUG3("building hash - key %1 value %2", _x, _value);
    [_hash, _x, _value] call CBA_fnc_hashSet;
} forEach _variableKeys;

DEBUG2("final hash %1" _hash);
INFO("character variables mapped to hash");
_hash



