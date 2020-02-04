#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Finds and return all join_requests for a particular squad.
 *
 * Arguments:
 * 0: _squad - <STRING> squad id you're querying for
 *
 * Return Value:
 * _allRequestForSquad <ARRAY> list of requests id's
 *
 * Example:
 * example
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_squad", ""]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

if (_character isEqualTo "") exitWith{
	ERROR("_squad is a required argument")
};

private _allRequestForSquad = format["SELECT id FROM join_requests WHERE request_squad = %1", _squad];
_allRequestForSquad = _allRequestForSquad call coopr_fnc_extDB3sql;

_allRequestForSquad;
