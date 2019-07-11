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
 * _strengths <CBA_HASH> - all determined strengths as an array of definitions categorised by a type hashkey
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
  private _strengths = EMPTY_HASH;

  private _foundInfantryEntities = _markerPos nearEntities ["Man", _markerRadius];
  private _foundMotorizedEntities = _markerPos nearEntities ["Car", _markerRadius];
  private _foundArmoredEntities = _markerPos nearEntities ["Tank", _markerRadius];


  {
    private _strength = [count (units _x)] call coopr_fnc_getStrengthByUnitCount;
    [_strengths, "Infantry", _strength] call CBA_fnc_hashSet;
  } forEach _foundInfantryEntities;

  {
    private _strength = [count (units _x)] call coopr_fnc_getStrengthByUnitCount;
    [_strengths, "Motorized", _strength] call CBA_fnc_hashSet;
  } forEach _foundMotorizedEntities;

  {
    private _strength = [count (units _x)] call coopr_fnc_getStrengthByUnitCount;
    [_strengths, "Armored", _strength] call CBA_fnc_hashSet;
  } forEach _foundArmoredEntities;

  _strengths;
} else {
  SERVER_ONLY_ERROR;
};
