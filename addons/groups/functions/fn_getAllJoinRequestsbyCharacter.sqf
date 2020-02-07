#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Finds and returns all join_requests a character has done
 *
 * Arguments:
 * 0: _characterID - <INTEGER> character id you're querying for
 *
 * Return Value:
 * _allRequestByCharacter <ARRAY> list of requests id's
 *
 * Example:
 * 123 call coopr_fnc_getAllJoinRequestsbyCharacter
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_characterID", objNull]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

if (_character isEqualTo objNull) exitWith{
	ERROR("_characterID is a required argument")
};

private _allRequestByCharacter = format["SELECT request_id 
										FROM join_requests 
										WHERE request_issuer = %1", _characterID];

_allRequestByCharacter = _allRequestByCharacter call coopr_fnc_extDB3sql;

_allRequestByCharacter;