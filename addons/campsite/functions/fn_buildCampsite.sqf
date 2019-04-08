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
		private _markerName = [player] call coopr_fnc_createMarkerUniqueName;
		private _builtNewMarker = [_markerName, player, [50,50]] call coopr_fnc_createMarkerArea;
		if(!_builtNewMarker) exitWith{
			[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [localize "str.coopr.campsite.notif.cantbuildinsidemarker"]] call CBA_fnc_notify;
		};
		
		private _localizedString = localize "str.coopr.campsite.notif.campsiteposition";
		private _campsitePos = format["%1: %2", _localizedString, mapGridPosition player];
		[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [_campsitePos]] call CBA_fnc_notify;
		player removeItem "coopr_item_camping";
		player setVariable["coopr_campingItem_0", false];
	};
	case 1: {
		[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], ["WORKS"]] call CBA_fnc_notify;
	};
};
