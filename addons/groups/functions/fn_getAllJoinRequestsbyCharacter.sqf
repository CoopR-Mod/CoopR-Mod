#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Finds and returns all join requests a character has done
 *
 * Arguments:
 * 0: _character - <STRING> character id you're querying for
 *
 * Return Value:
 * _allRequestByCharacter <ARRAY> list of requests id's
 *
 * Example:
 * example
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_character", objNull]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

if (_character isEqualTo objNull) exitWith{
	ERROR("_character is a required argument")
};

private _allRequestByCharacter = format["SELECT request_id FROM join_requests WHERE request_issuer = %1", _character];
_allRequestByCharacter = _allRequestByCharacter call coopr_fnc_extDB3sql;

_allRequestByCharacter;