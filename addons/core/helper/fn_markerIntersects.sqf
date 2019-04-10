#include "script_component.hpp"
/*
 * Author: Lou Montana
 *
 * checks if one marker intersects with another
 *
 * Arguments:
 * 0: _markerA <STRING> - name of marker one 
 * 1: _markerB <STRING> - name of marker one 
 *
 * Return Value:
 * _intersects - <BOOL>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_markerA", UNDEFINED],
        ["_markerB", UNDEFINED]];

if (_markerA isEqualTo UNDEFINED) exitWith { ERROR("required parameter undefined: _markerA") };
if (_markerB isEqualTo UNDEFINED) exitWith { ERROR("required parameter undefined: _markerB") };

private _distance = getMarkerPos _markerA distance getMarkerPos _markerB;
private _sizes = getMarkerSize _markerA + getMarkerSize _markerB;
private _biggestSize = selectMax _sizes;

_distance < _biggestSize *2;
