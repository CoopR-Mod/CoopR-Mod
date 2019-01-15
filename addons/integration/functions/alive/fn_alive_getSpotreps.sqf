#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all spotreps that were set by ALiVE mechanics. Can be filtered by player
 *
 * Arguments:
 * 0: _player <OBJECT> - (Optional) The unit from which the spotreps should be retrieved
 *
 * Return Value:
 * spotreps found <ARRAY>
 *
 * Example:
 * [_player] call coopr_fnc_getSpotreps;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_player", objNull]];

private _allSpotrepIDs = [alive_sys_spotrep_store] call CBA_fnc_hashKeys;
private _allSpotreps = [];

{
   private _key = _x;
   private _spotrep = [alive_sys_spotrep_store, _key] call CBA_fnc_hashGet;
   _allSpotreps pushBack _spotrep;
} forEach _allSpotrepIDs;

if (_player isEqualTo objNull) then {
    _allSpotreps
} else {
    private _playerUID = getPlayerUID _player;
    // filter only for spotreps created by given player
    _allSpotreps select { _x getVariable ["ALiVE_SYS_spotrep_player", ""] isEqualTo _playerUID };
};
