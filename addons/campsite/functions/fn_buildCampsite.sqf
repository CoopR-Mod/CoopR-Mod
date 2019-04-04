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
		private _localizedString = localize "str.coopr.campsite.build.startcampsite";
		private _campsitePos = format["%1: %2", _localizedString, mapGridPosition player];
		[[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], [_campsitePos]] call CBA_fnc_notify;
		player removeItems "coopr_item_camping";
	};
};
