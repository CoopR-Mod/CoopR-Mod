#include "..\constants.hpp"

params ["_profile"];
LSTART("LOGIN");
FLOG("%1 is logging in...", player);

private _slot = [_profile, KEY_SLOT] call CBA_fnc_hashGet;
private _name = [_profile, KEY_NAME] call CBA_fnc_hashGet;
private _class = [_profile, KEY_CLASS] call CBA_fnc_hashGet;
private _reputation = [_profile, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_profile, KEY_MONEY] call CBA_fnc_hashGet;
private _prisoner = [_profile, KEY_IS_PRISONER] call CBA_fnc_hashGet;
private _prisonTime = [_profile, KEY_PRISON_START] call CBA_fnc_hashGet;
private _position = [_profile, KEY_POSITION] call CBA_fnc_hashGet;
private _loadout = [_profile, KEY_LOADOUT] call CBA_fnc_hashGet;

player setVariable [KEY_SLOT, _slot, true];
[format ["variable %1: %2", KEY_SLOT, _slot], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_NAME, _name, true];
[format ["variable %1: %2", KEY_NAME, _name], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_CLASS, _class, true];
[format ["variable %1: %2", KEY_CLASS, _class], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_REPUTATION, _reputation, true];
[format ["variable %1: %2", KEY_REPUTATION, _reputation], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_MONEY, _money, true];
[format ["variable %1: %2", KEY_MONEY, _money], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_IS_PRISONER, _prisoner, true];
[format ["variable %1: %2", KEY_IS_PRISONER, _prisoner], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_PRISON_START, _prisonTime, true];
[format ["variable %1: %2", KEY_PRISON_START, _prisonTime], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_POSITION, _position, true];
[format ["variable %1: %2", KEY_POSITION, _position], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
LDEBUG("in login", _player getVariable [KEY_POSITION, -1]);

player setVariable [KEY_LOADOUT, _loadout, true];
[format ["variable %1: %2", KEY_LOADOUT, _loadout], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

["stored variables saved in player namespace", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_PLAYER_LOGGEDIN, true, true];
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

call X11_fnc_postLogin;
LEND("LOGIN");
