#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This marker is only used for debugging purposes and won't be shown in the released version
 *
 * Arguments:
 * 0: _object <OBJECT> - the objects position is used as a center point
 * 1: _size <ARRAY> - size of the marker cirlce
 * 2: _text <STRING> - text to add
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, [100,100], name _unit] call coopr_fnc_debugMarker;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_object", objNull, []],
        ["_size", [10,10]]];

DEBUG2("object: %1", _object);
if (_object isEqualTo objNull) exitWith { ERROR("_object was objNull") };

if (COOPR_DEV_MODE) then {
    private _pos = locationNull;
    _pos = getMarkerPos _object;

    private _debugMarker = createMarker ["debug_marker_" + (str serverTime), _pos];
    _debugMarker setMarkerSize _size;
    _debugMarker setMarkerColor "ColorBlue";
    _debugMarker setMarkerShape "ELLIPSE";
}
