#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * Tries to create a marker with given parameters. After creating it, 
 * check if the marker is intersecting with another user campsite marker or
 * the HQ. If it is, deletes the marker and returns false.
 *
 * Arguments:
 * 0: 
 *
 * Return Value:
 * Boolean - if the marker was created or not.
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_markerName", UNDEFINED], ["_position", UNDEFINED], ["_size", UNDEFINED], ["_shape", "ELLIPSE"], ["_alpha", 0]];
// CHECK_UNDEFINED_ARGUMENTS;
if(_markerName isEqualTo UNDEFINED) exitWith {ERROR("Undefined argument: _markerName")};
if(_position isEqualTo UNDEFINED) exitWith {ERROR("Undefined argument: _position")};
if(_size isEqualTo UNDEFINED) exitWith {ERROR("Undefined argument: _size")};

private _newMarker = createMarker[_markerName, _position];
_markerName setMarkerShape _shape;
_markerName setMarkerSize _size;
_markerName setMarkerAlpha _alpha;


// Check if marker is inside another important marker 
private _allMarkersSetByPlayer = allMapMarkers select {_x find "_campingArea_" > -1};
_allMarkersSetByPlayer = _allMarkersSetByPlayer - [_markerName];
DEBUG2("%1", _allMarkersSetByPlayer);

// ADD HQ to markers to check for 
if(!COOPR_DEV_MODE) then{
	_allMarkersSetByPlayer pushBack COOPR_HQ_WEST_BOUNDS;
}; 

if({[_markerName, _x] call coopr_fnc_markerIntersects}forEach _allMarkersSetByPlayer) exitWith {
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