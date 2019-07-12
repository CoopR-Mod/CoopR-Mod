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


params [["_marker", ""]];

if (_marker isEqualTo "") exitWith { ERROR("_marker was not defined") };

if (isServer) then {
    private _areaUnitStrength = EMPTY_HASH;

    INFO("determining infantry units in recon area");
    private _infantryStrengths = [_marker, "Man"] call coopr_fnc_determineUnitStrength;
    [_areaUnitStrength, "infantry", _infantryStrengths] call CBA_fnc_hashSet;

    INFO("determining motorized units in recon area");
    private _motorizedStrengths = [_marker, "Car"] call coopr_fnc_determineUnitStrength;
    [_areaUnitStrength, "motorized", _motorizedStrengths] call CBA_fnc_hashSet;

    INFO("determining armored units in recon area");
    private _armoredStrengths = [_marker, "Tank"] call coopr_fnc_determineUnitStrength;
    [_areaUnitStrength, "armored", _armoredStrengths] call CBA_fnc_hashSet;

    _areaUnitStrength
} else {
  SERVER_ONLY_ERROR;
};
