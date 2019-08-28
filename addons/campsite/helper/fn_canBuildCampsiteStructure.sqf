#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * This function checks if the player is able to build the structure given in
 * the parameter. Useful for showing/hiding the action in the action menu. 
 *
 * Arguments:
 * 0: _structure <STRING>, The structure the player could build.
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_structure", UNDEFINED]];
if(_structure isEqualTo UNDEFINED) then{
	ERROR("Required parameter undefined: _structure");
};

switch _structure do{
	case COOPR_CAMP_ITEM_AREA: {
		private _isSquadLeader = player call coopr_fnc_isSquadLeader;
		private _isInMission   = player call coopr_fnc_hasActiveMission;

		if(_isInMission AND _isSquadLeader) then {true} else {false};
	};
	case COOPR_CAMP_ITEM_TENT: {
		private _isInsideCampingArea = call coopr_fnc_isInsideCampingArea; //TODO check if player is inside his leader camping area
		private _hasTentItem = "coopr_item_foldedTent" in items player;
		private _isOnlyTent = true; //TODO check among all the tents in the world and see if this dude owns any of them _tent getVariable ["coopr_tent_owner", -1];

		if (_isInsideCampingArea AND _hasTentItem AND _isOnlyTent) then {true} else {false}; 
		};
};