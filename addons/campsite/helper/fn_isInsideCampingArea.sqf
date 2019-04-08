#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * TODO DOCSTRING
 *
 * Arguments:
 * 0: xyz
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

// Maybe consider checking this variable 1 time each session?
scopeName "main";

private _unitLeader = leader player;
private _characterName = _unitLeader getVariable ["coopr_character_name", ""];
_characterName = _characterName splitString " ";

while{_characterName find "" > -1} do{
	_characterName deleteAT (_characterName find " ");
};
_characterName = _characterName joinString "";
private _stringToSearch = format["%1"+"_campingArea_", _characterName];
private _allMarkers = allMapMarkers select {_x find _stringToSearch == 0};

// Maybe this approach is too expensive?
for "_x" from 0 to (count _allMarkers - 1) do {
    if(player inArea (_allMarkers select _x)) then {true} else {false}};
// _allMarkers apply {
// 	if(player inArea _x) then {true} else {false}
// };
// {if(player inArea _x) then {true} else {false}}forEach _allMarkers;
// {if(player inArea _x) then {{true breakOut "main"}} else {false breakOut "main"}}forEach _allMarkers;