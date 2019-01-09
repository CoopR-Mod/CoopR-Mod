#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Iterates through a cba hash and filters all "coopr" suffixed variable keys. Then sets all these to given player
 * object.
 *
 * Arguments:
 * 0: _hash <ARRAY> - CBA hash that contains the variables
 * 1: _character <OBJECT> - player/character object the filtered coopr variables should be applied to
 *
 * Return Value:
 * None
 *
 * Example:
 * [_cbaHash, _player] call coopr_fnc_deserializeCoopR
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_hash", []],["_character", objNull]];

if (not ([_hash] call CBA_fnc_isHash)) exitWith { ERROR("_hash is no CBA hash") };
if (_hash isEqualTo EMPTY_HASH) exitWith { ERROR("_hash was empty") };
if (_character isEqualTo objNull) exitWith { ERROR("_characters was objNull") };

private _hashKeys = [_hash] call CBA_fnc_hashKeys;
{
   private _value = [_hash, _x] call CBA_fnc_hashGet;
   _character setVariable [_x, _value, true];
} forEach (_hashKeys select { (_x find "coopr") == 0}); // only those prefixed with "coopr"
