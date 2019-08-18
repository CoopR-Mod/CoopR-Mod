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
		private _characterRole = player getVariable [COOPR_KEY_ROLE, COOPR_ROLE_LEADER ];
		if!(_characterRole isEqualTo COOPR_ROLE_LEADER) exitWith {false};
		true;
	};
	case COOPR_CAMP_ITEM_TENT: {
		private _conditionA = call coopr_fnc_isInsideCampingArea;
		private _conditionB = "coopr_item_foldedTent" in items player;
		private _conditionC = player getVariable ["coopr_activeTent"];
		if (_conditionA AND _conditionB AND _conditionC) then {true} else {false}; 
		};
};