#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Tries to add a tent to the player, updating its variable and checking
 * if the player already has a tent.
 * 
 * Arguments:
 * 0: _unit      - <OBJECT> The unit taking the folded tent item.
 * 1: _container - <OBJECT> Container from where the unit took the folded tent item.
 *
 * Return Value:
 * None
 *
 * Example:
 * trivial
 *
 * Public: No
 *
 * Scope: Client
 */

params["_unit", "_container"];

// Check if player already had a tent  
if (_unit getVariable ["coopr_campsite_hasTent", false]) exitWith{
	_unit removeItem "coopr_item_foldedTent";
	_container addItemCargo ["coopr_item_foldedTent", 1];

	[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [localize "str.coopr.campsite.notif.cantcarrymoretents"]] call CBA_fnc_notify;
};

_unit setVariable ["coopr_campsite_hasTent", true];
private _backPack = backpack _unit;
_unit removeItem "coopr_item_foldedTent";
[_unit, _backPack] call coopr_fnc_attachTentToPlayer;