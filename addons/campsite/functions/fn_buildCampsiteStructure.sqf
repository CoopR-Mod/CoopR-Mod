#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Tries to build a campsite structure on the player's position.
 * All possible paramters values are defined in the globals.hpp file.
 * 
 * Arguments:
 * 0: _structure <STRING> - What structure is the player trying to build.
 *  
 *
 * Return Value:
 * None
 *
 * Example:
 * [COOPR_CAMP_ITEM_TENT] call coopr_fnc_buildCampsiteStructure;
 * would try to build a tent at player's position.
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_structure", UNDEFINED]];
if(_structure isEqualTo UNDEFINED) exitWith{
	ERROR("Required parameter undefined: _structure");
};

switch _structure do{
	case COOPR_CAMP_ITEM_AREA: {
		private _markerName = [player] call coopr_fnc_createCampsiteMarkerUniqueName;
		private _builtNewMarker = [_markerName, player, [50,50]] call coopr_fnc_createCampsiteMarkerArea;
		if(!_builtNewMarker) exitWith{
			[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [localize "str.coopr.campsite.notif.cantbuildinsidemarker"]] call CBA_fnc_notify;
		};
		
		private _localizedString = localize "str.coopr.campsite.notif.campsiteposition";
		private _campsitePos = format["%1: %2", _localizedString, mapGridPosition player];
		[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], [_campsitePos]] call CBA_fnc_notify;
	};
	case COOPR_CAMP_ITEM_TENT: {
		[[COOPR_LOGO_SMALL], ["INFO:", 1.3, COOPR_BRAND_COLOR], ["str.coopr.campsite.notif.tentspawned"]] call CBA_fnc_notify;
	};
};
