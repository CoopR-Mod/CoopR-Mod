#include "script_component.hpp"

params [["_character", []]];

if(not ([_character] call CBA_fnc_isHash)) exitWith {
    ERROR("argument has to be a cba hash");
};

INFO2("%1 is logging in", player);

private _slot = [_character, COOPR_KEY_SLOT] call CBA_fnc_hashGet;
private _name = [_character, COOPR_KEY_NAME] call CBA_fnc_hashGet;
private _role = [_character, COOPR_KEY_ROLE] call CBA_fnc_hashGet;
private _state = [_character, COOPR_KEY_STATE] call CBA_fnc_hashGet;
private _woundedTimestamp = [_character, COOPR_KEY_WOUNDED_TIMESTAMP] call CBA_fnc_hashGet;
private _reputation = [_character, COOPR_KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_character, COOPR_KEY_MONEY] call CBA_fnc_hashGet;
private _position = [_character, COOPR_KEY_POSITION] call CBA_fnc_hashGet;
private _loadout = [_character, COOPR_KEY_LOADOUT] call CBA_fnc_hashGet;

player setVariable [COOPR_KEY_SLOT, _slot, true];
player setVariable [COOPR_KEY_NAME, _name, true];
player setVariable [COOPR_KEY_ROLE, _role, true];
player setVariable [COOPR_KEY_STATE, _state, true];
player setVariable [COOPR_KEY_WOUNDED_TIMESTAMP, _woundedTimestamp, true];
player setVariable [COOPR_KEY_REPUTATION, _reputation, true];
player setVariable [COOPR_KEY_MONEY, _money, true];
player setVariable [COOPR_KEY_POSITION, _position, true];
player setVariable [COOPR_KEY_LOADOUT, _loadout, true];

[_character] call coopr_fnc_characterStatePrettyLog;

DEBUG("stored variables saved in player namespace");

player setVariable [COOPR_KEY_PLAYER_LOGGEDIN, true, true];
INFO2("player with id %1 logged in", getPlayerUID player);
call coopr_fnc_postLogin;
