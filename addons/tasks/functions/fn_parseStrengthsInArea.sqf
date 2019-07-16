#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Parses the strength of infantry, motorized and armor in an area and returns a CBA hash to aggregate all
 *
 * Arguments:
 * 0: _marker <MARKER> - Marker of the area to check
 *
 * Return Value:
 * _strengths <CBA_HASH> - all parsed strengths as an array of definitions categorised by a type hashkey
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */
#define X 0

params [["_marker", ""]];

if (_marker isEqualTo "") exitWith { ERROR("_marker was not defined") };

if (isServer) then {
    private _areaUnitStrength = EMPTY_HASH;
    private _markerPos = getMarkerPos _marker;
    private _markerRadius = getMarkerSize _marker select X;

    INFO("determining infantry units in recon area");
    private _infantryStrengths = [_marker, "Man"] call coopr_fnc_determineUnitStrength;
    [_areaUnitStrength, COOPR_TASK_REPORT_TYPE_INFANTRY, _infantryStrengths] call CBA_fnc_hashSet;

    INFO("determining motorized units in recon area");
    private _entities = _markerPos nearEntities ["Car", _markerRadius];
    [_areaUnitStrength, COOPR_TASK_REPORT_TYPE_MOTORIZED, count _entities] call CBA_fnc_hashSet;

    INFO("determining armored units in recon area");
    private _entities = _markerPos nearEntities ["Tank", _markerRadius];
    [_areaUnitStrength, COOPR_TASK_REPORT_TYPE_ARMORED, count _entities] call CBA_fnc_hashSet;

    _areaUnitStrength
} else {
  SERVER_ONLY_ERROR;
};
