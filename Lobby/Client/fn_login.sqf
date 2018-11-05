#include "..\constants.hpp"

params [["_character", []]];

LSTART("LOGIN");

if(not ([_character] call CBA_fnc_isHash)) exitWith {
    ERROR("argument has to be a cba hash");
};

FLOG("%1 is logging in...", player);

private _slot = [_character, KEY_SLOT] call CBA_fnc_hashGet;
private _name = [_character, KEY_NAME] call CBA_fnc_hashGet;
private _class = [_character, KEY_CLASS] call CBA_fnc_hashGet;
private _state = [_character, KEY_STATE] call CBA_fnc_hashGet;
private _deathTimestamp = [_character, KEY_DEATH_TIMESTAMP] call CBA_fnc_hashGet;
private _reputation = [_character, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_character, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_character, KEY_IS_PRISONER] call CBA_fnc_hashGet;
private _prisonTime = [_character, KEY_PRISON_START] call CBA_fnc_hashGet;
private _position = [_character, KEY_POSITION] call CBA_fnc_hashGet;
private _loadout = [_character, KEY_LOADOUT] call CBA_fnc_hashGet;

player setVariable [KEY_SLOT, _slot, true];
player setVariable [KEY_NAME, _name, true];
player setVariable [KEY_CLASS, _class, true];
player setVariable [KEY_STATE, _state, true];
player setVariable [KEY_DEATH_TIMESTAMP, _deathTimestamp, true];
player setVariable [KEY_REPUTATION, _reputation, true];
player setVariable [KEY_MONEY, _money, true];
player setVariable [KEY_IS_PRISONER, _prisoner, true];
player setVariable [KEY_PRISON_START, _prisonTime, true];
player setVariable [KEY_POSITION, _position, true];
player setVariable [KEY_LOADOUT, _loadout, true];

[_character] call X11_fnc_characterStatePrettyLog;

SLOG("stored variables saved in player namespace");

player setVariable [KEY_PLAYER_LOGGEDIN, true, true];
FLOG("player with id %1 logged in", getPlayerUID player);
call X11_fnc_postLogin;

LEND("LOGIN");
