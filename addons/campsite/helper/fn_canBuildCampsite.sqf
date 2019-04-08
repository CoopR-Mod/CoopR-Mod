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
		if(!(player getVariable ["coopr_campingItem_0", false])) exitWith {false};
		if(!isFormationLeader player) exitWith{false};
		true;
	};
	case 1: {
		private _condition = call coopr_fnc_isInsideCampingArea;
		_condition;
		};
};