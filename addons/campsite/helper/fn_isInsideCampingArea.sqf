#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * This function checks if the player is inside of one of his 
 * campsite areas. 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean - Wether the player is inside a campsite of his own or not.
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

private _unitLeader = leader player;
private _characterName = _unitLeader getVariable ["coopr_character_name", ""];
_characterName = _characterName splitString " ";

while{_characterName find "" > -1} do{
	_characterName deleteAT (_characterName find " ");
};
_characterName = _characterName joinString "";
private _stringToSearch = format["%1"+"_campingArea_", _characterName];
private _allMarkersSetByPlayer = allMapMarkers select {_x find _stringToSearch == 0};

// TODO: refactor the shit out of this
for "_x" from 0 to (count _allMarkersSetByPlayer - 1) do {
    if(player inArea (_allMarkersSetByPlayer select _x)) then {true} else {false}};