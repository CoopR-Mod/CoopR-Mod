#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * A copy of Highheads function from the ALiVE project. (but cooler)
 * This will check in 500 steps for the nearest location used for missions
 *
 * Arguments:
 * 0: _referencePosition <ARRAY> - position to start lookup from
 *
 * Return Value:
 * location found - <OBJECT>
 *
 * Example:
 *  call coopr_fnc_getNearestLocation;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_referencePosition", []], ["_distance", 1000]];

if (_referencePosition isEqualTo []) exitWith { ERROR("_referencePosition was empty []") };

private _nearLocations = nearestLocations [_referencePosition, ["NameVillage","NameCity","NameCityCapital","NameLocal"], _distance];

while {count _nearLocations < 1} do {
    _distance = _distance + 500;
    _nearLocations = nearestLocations [_referencePosition, ["NameVillage","NameCity","NameCityCapital","NameLocal"], _distance];
};

_nearLocations select 0;
