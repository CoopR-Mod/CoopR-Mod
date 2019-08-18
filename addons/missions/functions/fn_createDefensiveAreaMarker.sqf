#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will create a defense area marker of the recon report. This is used to determine the area where
 * reported units should appear.
 *
 * Arguments:
 * 0: _markerText <STRING> - description of the marker
 *
 * Return Value:
 * _defenseMarker <STRING> - returns the marker for the defense
 *
 * Public: No
 *
 * Scope: Client 
 */
params [["_markerText", ""]];

if (_markerText isEqualTo "") exitWith { ERROR("_markerText was ''") };

DEBUG("creating defensive area marker");
private _staticMarker = allMapMarkers select { (markerText _x) isEqualTo _markerText };

if ((count _staticMarker) > 1) exitWith {
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["Marker name is not unique"]] call CBA_fnc_notify;
};

if ((count _staticMarker) == 0) exitWith {
   private _message = format ["No marker with name %1", _markerText];
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
};
private _markerName = "coopr_defense_marker_" + (str serverTime) + (str random 10);
private _defenseMarker = createMarker [_markerName, getMarkerPos (_staticMarker select 0)];

_defenseMarker setMarkerSize [COOPR_MARKER_DEFENSE_DIAMETER, COOPR_MARKER_DEFENSE_DIAMETER];
_defenseMarker setMarkerShape "ELLIPSE";
_defenseMarker setMarkerColor "ColorGreen";
if !(COOPR_DEV_MODE) then {
    _defenseMarker setMarkerAlpha 0; // make invisible if not in dev mode
};

_defenseMarker // return
