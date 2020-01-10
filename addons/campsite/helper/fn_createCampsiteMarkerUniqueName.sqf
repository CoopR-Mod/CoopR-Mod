#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * This function will help with creating uniques names for markers, based on
 * player name and how many markers the player already has made.
 *
 * Arguments:
 * 0: _player <OBJECT> - The player that's trying to create a new marker
 *
 * Return Value:
 * _uniqueMarkerName - <STRING>
 *
 * Example:
 * [player] call coopr_fnc_createUniqueMarkerName;
 * if the character is called "Gilles" and this is his first marker
 * this function would return "Gilles_campingArea_0"
 *
 * Public: No
 *
 * Scope: Client
 */

params[["_player", "undefined"]];

private _characterName = player getVariable ["coopr_character_name", ""];
// _characterName = _characterName splitString " ";

// while{_characterName find "" > -1} do{
// 	_characterName deleteAT (_characterName find " ");
// };
// _characterName = _characterName joinString "";

_characterName = [_characterName, " ", ""] call coopr_fnc_stringReplace;

 //Getting all markers from map with the player name
private _stringToSearch = format[_characterName +"_campingArea_"];
private _allMarkersSetByPlayer = allMapMarkers select {_x find _stringToSearch == 0};
private _markerNumber = count _allMarkersSetByPlayer;

private _uniqueMarkerName = format["%1"+"%2", _stringToSearch, _markerNumber];

_uniqueMarkerName;

