#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * TODO DOCSTRING
 *
 * Arguments:
 * 0: _structure <STRING> - What structure is the player trying to build.
 * Possible values are defined in the constants.hpp file from the campsite 
 * module.
 *
 * Return Value:
 * None
 *
 * Example:
 * [COOPR_CAMP_ITEM_TENT] call coopr_fnc_buildCampsite;
 * would try to build a tent at player's position.
 *
 * Public: No
 *
 * Scope: Client
 */

params["_structure"];

switch _structure do{
	case COOPR_CAMP_ITEM_AREA: {
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
	case COOPR_CAMP_ITEM_TENT: {
		[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], ["WORKS"]] call CBA_fnc_notify;
	};
};
