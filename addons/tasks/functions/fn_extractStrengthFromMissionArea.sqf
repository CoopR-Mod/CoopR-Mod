#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Calculates enemy units in the given mission area (as marker) and returns an array of strength definitions
 *
 * Arguments:
 * 0: _missionMarker <MARKER> - Marker of the mission area
 *
 * Return Value:
 * _strengths <ARRAY> - all determined strengths as an array of definitions
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_missionMarker", objNull]];

if (_missionMarker isEqualTo objNull) exitWith { ERROR("_missionMarker was not defined") };

if (isServer) then {
  INFO("parsing mission area units");
  private _markerPos = getPos _missionMarker;
  private _markerRadius = getMarkerSize _missioMarker;
  private _strengths = [];

  private _foundInfantryEntities = _markerPos nearEntities ["Man", _markerRadius];

  {
    private _strength = [count (units _x)] call coopr_fnc_getStrengthByUnitCount;
    _strengths pushBack _strength;
  } forEach _foundInfantryEntities;

  _strengths; // return
} else {
  SERVER_ONLY_ERROR;
};
