#include "script_component.hpp"
/*
 * Author: Lou Montana
 *
 * checks if one marker overlapping with another
 *
 * Arguments:
 * 0: _markerA <STRING> - name of marker one 
 * 1: _markerB <STRING> - name of marker one 
 *
 * Return Value:
 * _overlapping - <BOOL>
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

private _overlapping = !((getMarkerPos _markerA distance getMarkerPos _markerB) > (selectMax getMarkerSize _markerA + selectMax getMarkerSize _markerB));

_overlapping;