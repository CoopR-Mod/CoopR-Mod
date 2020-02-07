#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Tries to create a join_request to a squad. Checks if given character
 * has already done a join requests to the squad and fails to do so if true 
 *
 * Arguments:
 * 0: _characterID - <INTEGER> character's id whos trying to create a join request
 * 1: _squadID - <INTEGER> squad's id the character is trying to create a join request for
 *
 * Return Value:
 * None
 *
 * Example:
 * ["123", 456] call coopr_fnc_createSquadJoinRequest
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_characterID", objNull], ["_squadID", ""]];

if !(isServer) exitWith {
	SERVER_ONLY_ERROR(__FILE__);
};

if (_characterID isEqualTo objNull) exitWith {
     ERROR("_character was null during squad request creation")
};

if (_squadID isEqualTo "") exitWith {
    ERROR2("_squadID undefined while trying to create join request of %1", _characterID)
};

DEBUG("checking if character has already done this request...");
private _characterRequests = _characterID call coopr_fnc_getAllJoinRequestsForCharacter;
private _squadRequests = _squadID call coopr_fnc_getAllJoinRequestsForSquad;

if (_characterRequests findIf{
	_x in _squadRequests} > -1) exitWith {
		ERROR("Character has already requested to join this squad");
};

DEBUG("Inserting squad request into join_requests table");

private _joinRequest = format ["INSERT INTO join_requests 
								(request_issuer, request_squad, status) 
								VALUES (%1, %2, 'pending')", _characterID, _squadID];

_joinRequest call coopr_fnc_extDB3sql;

DEBUG("Join requests created");
