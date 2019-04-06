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
