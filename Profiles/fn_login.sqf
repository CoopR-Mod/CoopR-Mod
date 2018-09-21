#include "../globals.hpp"
#include "constants.hpp"

params ["_playerProfile"];

player setVariable [KEY_PLAYER_LOGGEDIN, true];

private _class = [_playerProfile, KEY_CLASS] call CBA_fnc_hashGet;
private _reputation = [_playerProfile, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_playerProfile, KEY_MONEY] call CBA_fnc_hashGet;
private _renegade = [_playerProfile, KEY_IS_RENEGADE] call CBA_fnc_hashGet;
private _prisonTime = [_playerProfile, KEY_PRISON_START] call CBA_fnc_hashGet;

player setVariable [KEY_CLASS, _class];
player setVariable [KEY_REPUTATION, _reputation];
player setVariable [KEY_MONEY, _money];
player setVariable [KEY_IS_RENEGADE, _renegade];
player setVariable [KEY_PRISON_START, _renegade];

["stored variables saved in player namespace", DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
