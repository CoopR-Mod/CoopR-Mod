
#include "..\constants.hpp"

params ["_playerProfile"];

private _naem = [_playerProfile, KEY_NAME] call CBA_fnc_hashGet;
private _class = [_playerProfile, KEY_CLASS] call CBA_fnc_hashGet;
private _reputation = [_playerProfile, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_playerProfile, KEY_MONEY] call CBA_fnc_hashGet;
private _renegade = [_playerProfile, KEY_IS_RENEGADE] call CBA_fnc_hashGet;
private _prisonTime = [_playerProfile, KEY_PRISON_START] call CBA_fnc_hashGet;
private _position = [_playerProfile, KEY_POSITION] call CBA_fnc_hashGet;
private _prisonPosition = [_playerProfile, KEY_PRISON_FREE_POSITION] call CBA_fnc_hashGet;
private _loadout = [_playerProfile, KEY_LOADOUT] call CBA_fnc_hashGet;

player setVariable [KEY_NAME, _name];
[format ["variable %1: %2", KEY_NAME, _name], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_CLASS, _class];
[format ["variable %1: %2", KEY_CLASS, _class], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_REPUTATION, _reputation];
[format ["variable %1: %2", KEY_REPUTATION, _reputation], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_MONEY, _money];
[format ["variable %1: %2", KEY_MONEY, _money], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_IS_RENEGADE, _renegade];
[format ["variable %1: %2", KEY_IS_RENEGADE, _renegade], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_PRISON_START, _prisonTime];
[format ["variable %1: %2", KEY_PRISON_START, _prisonTime], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_PRISON_FREE_POSITION, _prisonPosition];
[format ["variable %1: %2", KEY_PRISON_FREE_POSITION, _prisonPosition], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_POSITION, _position];
[format ["variable
 %1: %2", KEY_POSITION, _position], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_LOADOUT, _loadout];
[format ["variable %1: %2", KEY_LOADOUT, _loadout], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

["stored variables saved in player namespace", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

player setVariable [KEY_PLAYER_LOGGEDIN, true, true];
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

call X11_fnc_postLogin;
