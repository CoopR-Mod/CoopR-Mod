#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * serializes a marker to a hash object
 *
 * Arguments:
 * 0: _marker <STRING> - name of the marker
 * 1: _removeMarker <BOOL> - flag to remove the marker after serialization (optional)
 *
 * Return Value:
 * _serializedMarker - <ARRAY>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_marker", ""],
        ["_removeMarker", false]];

if (_marker isEqualTo "") exitWith { ERROR("_marker was empty string") };
private _serializedMarker = [];

{
  _serializedMarker pushBack (_marker call _x);
} forEach [
    { _this }, // simply storing the name
    { markerPos _this },
    { markerType _this },
    { markerSize _this },
    { markerShape _this },
    { markerText _this },
    { markerBrush _this },
    { markerDir _this },
    { markerAlpha _this },
    { markerColor _this }];

DEBUG("marker serialized");
if (_removeMarker) then { deleteMarker _marker };
_serializedMarker;
