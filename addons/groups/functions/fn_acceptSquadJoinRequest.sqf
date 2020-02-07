#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Updates a join_request state to accepted.
 *
 * Arguments:
 * 0: _requestID - <INTEGER> id of the join_requests to update
 *
 * Return Value:
 * None
 *
 * Example:
 * 123 call coopr_fnc_acceptSquadJoinRequest
 *
 * Public: No
 *
 * Scope: Server
 */

 params[["_requestID", ""]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

private _acceptRequest = format["UPDATE join_requests 
						SET status = 'accepted' 
						WHERE id=%1;", _requestID];

_acceptRequest call coopr_fnc_extDB3sql;

