#include "..\constants.hpp"

params ["_profile"];
LSTART("LOGIN");
FLOG("%1 is logging in...", player);

private _slot = [_profile, KEY_SLOT] call CBA_fnc_hashGet;
private _name = [_profile, KEY_NAME] call CBA_fnc_hashGet;
private _class = [_profile, KEY_CLASS] call CBA_fnc_hashGet;
private _state = [_profile, KEY_STATE] call CBA_fnc_hashGet;
private _deathTimestamp = [_profile, KEY_DEATH_TIMESTAMP] call CBA_fnc_hashGet;
private _reputation = [_profile, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_profile, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_profile, KEY_IS_PRISONER] call CBA_fnc_hashGet;
private _prisonTime = [_profile, KEY_PRISON_START] call CBA_fnc_hashGet;
private _position = [_profile, KEY_POSITION] call CBA_fnc_hashGet;
private _loadout = [_profile, KEY_LOADOUT] call CBA_fnc_hashGet;

player setVariable [KEY_SLOT, _slot, true];
FFLOG("set state %1 to %2", KEY_SLOT, _slot);

player setVariable [KEY_NAME, _name, true];
FFLOG("set state %1 to %2", KEY_NAME, _name);

player setVariable [KEY_CLASS, _class, true];
FFLOG("set state %1 to %2", KEY_CLASS, _class);

player setVariable [KEY_STATE, _state, true];
FFLOG("set state %1 to %2", KEY_STATE, _state);

player setVariable [KEY_DEATH_TIMESTAMP, _deathTimestamp, true];
FFLOG("set state %1 to %2", KEY_DEATH_TIMESTAMP, _deathTimestamp);

player setVariable [KEY_REPUTATION, _reputation, true];
FFLOG("set state %1 to %2", KEY_REPUTATION, _reputation);

player setVariable [KEY_MONEY, _money, true];
FFLOG("set state %1 to %2", KEY_MONEY, _money);

player setVariable [KEY_IS_PRISONER, _prisoner, true];
FFLOG("set state %1 to %2", KEY_IS_PRISONER, _prisoner);

player setVariable [KEY_PRISON_START, _prisonTime, true];
FFLOG("set state %1 to %2", KEY_PRISON_START, _prisonTime);

player setVariable [KEY_POSITION, _position, true];
FFLOG("set state %1 to %2", KEY_POSITION, _position);

player setVariable [KEY_LOADOUT, _loadout, true];
FFLOG("set state %1 to %2", KEY_LOADOUT, _loadout);

SLOG("stored variables saved in player namespace");

player setVariable [KEY_PLAYER_LOGGEDIN, true, true];
FLOG("player with id %1 logged in", getPlayerUID player);

call X11_fnc_postLogin;
LEND("LOGIN");
