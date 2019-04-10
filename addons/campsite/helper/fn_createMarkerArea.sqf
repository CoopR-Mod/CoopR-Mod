#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * TODO DOCSTRING
 *
 * Arguments:
 * 0: 
 *
 * Return Value:
 * _var - <STRING>
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_markerName", "objNull"], ["_position", "objNull"], ["_size", "objNull"], ["_shape", "ELLIPSE"], ["_alpha", 0]];
// CHECK_UNDEFINED_ARGUMENTS;
if(_markerName isEqualTo "objNull") exitWith {ERROR("Undefined argument, _markerName")};
if(_position isEqualTo "objNull") exitWith {ERROR("Undefined argument, _position")};
if(_size isEqualTo "objNull") exitWith {ERROR("Undefined argument, _size")};

private _newMarker = createMarker[_markerName, _position];
_markerName setMarkerShape _shape;
_markerName setMarkerSize _size;
_markerName setMarkerAlpha _alpha;


// Check if marker is inside another important marker 
private _allMarkers = allMapMarkers select {_x find "_campingArea_" > -1};
_allMarkers = _allMarkers - [_markerName];
DEBUG2("%1", _allMarkers);
// _allMarkers pushBack COOPR_HQ_WEST_BOUNDS;
if({[_markerName, _x] call coopr_fnc_markerIntersects}forEach _allMarkers) exitWith {
	DEBUG("Campsite is inside another marker");
	deleteMarker _markerName;

	false};

if(COOPR_DEV_MODE)then{
	_markerName setMarkerAlpha 1;
	_markerName setMarkerColor "ColorBlue";
	private _debugMarker = createMarker ["debug_marker_" + (str serverTime), _position];
	_debugMarker setMarkerType "hd_dot";
	_debugMarker setMarkerText _markerName; 
};
// succesfully created new marker
INFO("Campsite created!");
true;