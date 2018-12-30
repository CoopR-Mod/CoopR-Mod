#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Convert all prefix specific variables of a character (player) object into a CBA hash.
 * This function is used to map the player/character state to i.e. push it into
 * the persistence layer (extDB3/CoopR HQ)
 *
 * Arguments:
 * 0: _prefix <STRING> - prefix of variables i.e. coopr_my_var or ace_their_var
 * 1: _character <OBJECT> - character to convert all prefix variables from
 *
 * Return Value:
 * CBA_Hash <ARRAY>
 *
 * Example:
 * ["coopr", player] call coopr_fnc_prefixVariablesToHash
 * ["ace", player] call coopr_fnc_prefixVariablesToHash
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_prefix", ""],
        ["_character", objNull]];

if(_prefix isEqualTo "") then { ERROR("given _prefix is empty string") };
if(_character isEqualTo objNull) then { ERROR("given _character object was null") };

INFO("start mapping character variables to hash");
DEBUG2("character object is %1", _character);
INFO2("filter by prefix %1", _prefix);
private _variableKeys = allVariables player;
private _prefixedKeys = _variableKeys select { (_x find _prefix) == 0};
private _hash = EMPTY_HASH;

{
    private _value = _character getVariable _x;
    DEBUG3("building hash - key %1 value %2", _x, _value);
    [_hash, _x, _value] call CBA_fnc_hashSet;
} forEach _prefixedKeys;

DEBUG2("final hash %1" _hash);
INFO("character variables mapped to hash");
_hash



