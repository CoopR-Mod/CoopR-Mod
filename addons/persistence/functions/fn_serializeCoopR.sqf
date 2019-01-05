#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the state of the player object reflecting all CoopR variables
 *
 * Arguments:
 * 0: _character <OBJECT> - the object of the actual player/character
 *
 * Return Value:
 * CBA Hash <ARRAY>
 *
 * Example:
 * player call coopr_fnc_serializeCoopR
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_character", objNull]];

if (_character isEqualTo objNull) exitWith { ERROR("_characters was objNull") };

private _hash = [[],[]] call CBA_fnc_hashCreate;
{
    DEBUG2("x:%1", _x);
    DEBUG2("value:%1", _character getVariable _x);
    [_hash, _x, _character getVariable _x] call CBA_fnc_hashSet;
} forEach (allVariables _character select { (_x find "coopr") == 0}); // only those prefixed with "coopr"

_hash
