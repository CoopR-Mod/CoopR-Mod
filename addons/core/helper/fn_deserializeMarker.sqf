#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * deserializes a marker to a marker or
 *
 * Arguments:
 * 0: _serializedMarker <ARRAY> - serialized state of a marker
 * 1: _newMarkername <STRING> - flag to remove the marker after serialization (optional)
 *
 * Return Value:
 * _deserializedMarker - <MARKER>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_serializedMarker", []],
        ["_newMarkername", ""]];

if (_serializedMarker isEqualTo []) exitWith { ERROR("_serializedMarker was not defined") };
private _markerName = _serializedMarker deleteAt 0;
if !(_newMarkername isEqualTo "") then { _markerName = _newMarkername; }; // set override marker name

private _deserializedMarker = createMarker [_markerName, _serializedMarker deleteAt 0];
{
    (_serializedMarker select _forEachIndex) call _x;
} forEach [
    // omitting marker name element
    // omitting position
    { _deserializedMarker setMarkerType _this },
    { _deserializedMarker setMarkerSize _this },
    { _deserializedMarker setMarkerShape _this },
    { _deserializedMarker setMarkerText _this },
    { _deserializedMarker setMarkerBrush _this },
    { _deserializedMarker setMarkerDir _this },
    { _deserializedMarker setMarkerColor _this }];

DEBUG("marker deserialized");
_deserializedMarker;
