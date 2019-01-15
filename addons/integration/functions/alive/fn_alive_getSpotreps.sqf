#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all spotreps that were set by ALiVE mechanics
 *
 * Arguments:
 * None
 *
 * Return Value:
 * spotreps found - <ARRAY>
 *
 * Example:
 * call coopr_fnc_getSpotreps;
 *
 * Public: No
 *
 * Scope: Global
 */

private _allSpotrepIDs = [alive_sys_spotrep_store] call CBA_fnc_hashKeys;
private _allSpotreps = [];

{
   private _key = _x;
   private _spotrep = [alive_sys_spotrep_store, _key] call CBA_fnc_hashGet;
   _allSpotreps pushBack _spotrep;
} forEach _allSpotrepIDs;

_allSpotreps
