#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * calls the janitor to get rid of the garbage requests populating the DB
 *
 * Arguments:
 * --
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_cleanAcceptedJoinRequests
 *
 * Public: No
 *
 * Scope: Server
 */

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

private _garbageRequests = "SELECT id FROM join_requests 
							WHERE status = 'accepted'";

_garbageRequests = _garbageRequests call coopr_fnc_extDB3sql;

_garbageRequests apply{
	format["DELETE FROM join_requests WHERE id = %1", _x]
};

INFO2("%1 entries deleted from join_requests table!", count _garbageRequests)
