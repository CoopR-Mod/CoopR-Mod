#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * TODO DOCSTRING
 *
 * Arguments:
 * 0: xyz
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

params["_structure"];

switch _structure do{
	case 0: {
		if(!(player getVariable "coopr_campingItem_0")) exitWith {false};
		if(player inArea COOPR_HQ_WEST_BOUNDS) exitWith{false};
		if(!isFormationLeader player) exitWith{false};
		DEBUG("Player has the item, is outside of the HQ area and is a squad leader. Player can build");
		true;
	};
};