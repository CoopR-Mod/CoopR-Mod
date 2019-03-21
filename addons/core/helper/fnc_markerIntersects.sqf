#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * checks if one marker intersects with another
 *
 * Arguments:
 * 0: _markerA <STRING> - name of marker one
 * 1: _markerB <STRING> - name of marker two
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

params [["_markerA", ""],
        ["_markerB", ""]];

if (_markerA isEqualTo "") exitWith { ERROR("_markerA was empty string") };
if (_markerB isEqualTo "") exitWith { ERROR("_markerB was empty string") };

private _posA = getMarkerPos _markerA;
_posA inArea _markerB;
