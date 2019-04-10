#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Detects when the player has picked up or dropped an item.
 * If the item is the camping item, updates the player variable 
 * that grants or denies him the option to build.
 * //TODO: this EH should be refactored asap to be more general and for use of everyone.
 *
 * Arguments:
 * 0: _type - <NUMBER> The type of event, 0 for dropping, 1 for taking.
 * 1: _item - <STRING> The item class the player dropped/picked
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

params["_type", "_item"];

switch _type do{
	case 1 : {
		if(_item isEqualTo "coopr_item_camping")then{
			DEBUG3("%1 dropped the %2", name player, _item);
			
			player setVariable ["coopr_campingItem_0", false];
			private _debugVar = player getVariable "coopr_campingItem_0";
			DEBUG2("has the item = %1", _debugVar);
		};
	};
	case 2 : {
		if(_item isEqualTo "coopr_item_camping")then{
			DEBUG3("%1 took the %2", name player, _item);
			
			player setVariable ["coopr_campingItem_0", true];

			private _debugVar = player getVariable "coopr_campingItem_0";
			DEBUG2("has the item = %1", _debugVar);
		};
	}; 
};
