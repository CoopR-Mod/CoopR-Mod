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

    DEBUG("determining infantry units in recon area");
    private _infantryStrengths = [_marker, "Man"] call coopr_fnc_determineUnitStrength;
    [_areaUnitStrength, COOPR_MISSION_REPORT_TYPE_INFANTRY, _infantryStrengths] call CBA_fnc_hashSet;

    DEBUG("determining motorized units in recon area");
    private _entities = _markerPos nearEntities ["Car", _markerRadius];
    private _array = [];
    // if this logic looks weird - ask xetra11 for reasons :D
    for "_i" from 1 to (count _entities) do { _array pushBack "1" };
    [_areaUnitStrength, COOPR_MISSION_REPORT_TYPE_MOTORIZED, _array] call CBA_fnc_hashSet;
    DEBUG2("found motorized: %1", count _entities);

    DEBUG("determining armored units in recon area");
    _entities = _markerPos nearEntities ["Tank", _markerRadius];
    _array = [];
    for "_i" from 1 to (count _entities) do { _array pushBack "1" };
    [_areaUnitStrength, COOPR_MISSION_REPORT_TYPE_ARMORED, _array] call CBA_fnc_hashSet;
    DEBUG2("found armored: %1", count _entities);

    DEBUG2("area overall unit strength : %1", _areaUnitStrength);
    _areaUnitStrength //return

} else {
  SERVER_ONLY_ERROR(__FILE__);
};
