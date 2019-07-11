#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Calculates enemy units in the given area (as marker) and returns an array of strength definitions
 *
 * Arguments:
 * 0: _marker <MARKER> - Marker of the area to check
 * 1: _type <TYPE> - unit type ("Man", "Car", "Tank")
 *
 * Return Value:
 * _strengths <CBA_HASH> - all determined strengths as an array of definitions categorised by a type hashkey
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

#define X 0

params [["_marker", ""],
        ["_type", objNull]];

if (_marker isEqualTo "") exitWith { ERROR("_marker was not defined") };
if (_type isEqualTo objNull) exitWith { ERROR("_type was not defined") };

if (isServer) then {

    INFO2("looking up in marker: %1", _marker);
    private _markerPos = getMarkerPos _marker;
    private _markerRadius = getMarkerSize _marker select X;

    // INFANTRY
    private _entities = _markerPos nearEntities [_type, _markerRadius];
    if (_entities isEqualTo []) exitWith { INFO("no entities found"); []};
    private _groups = [_entities] call coopr_fnc_groupsByEntities;
    private _strengths = [];

    DEBUG2("groups: %1", _groups);
    {
        private _grp = _x;
        DEBUG2("counting group: %1", _grp);
        private _count = [_grp] call coopr_fnc_countUnits;
        DEBUG2("units in group: %1", _count);
        _strengths pushBack ([_count] call coopr_fnc_getStrengthByUnitCount);
    } forEach _groups;

    DEBUG2("found strengths: %1", _strengths);
    _strengths;
} else {
  SERVER_ONLY_ERROR;
};
