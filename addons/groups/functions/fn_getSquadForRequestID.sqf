#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Finds and returns squad_id of a particular join_request
 *
 * Arguments:
 * 0: _requestID - <INTEGER> request you're querying for
 *
 * Return Value:
 * _squadID <INTEGER> string that represents squad.
 *
 * Example:
 * 123 call coopr_fnc_getSquadForRequestID
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_requestID", ""]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

if (_requestID isEqualTo "") exitWith{
	ERROR("_requestID is a required argument");
};

private _squadID = format["SELECT request_squad 
						FROM join_requests 
						WHERE id = %1", _requestID];

_squadID = _squadID call coopr_fnc_extDB3sql;

_squadID;