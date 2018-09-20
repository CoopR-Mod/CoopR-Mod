#include "../globals.hpp"
#include "constants.hpp"

params ["_playerProfile"];

//TODO: set profile parameters

player setVariable [KEY_PLAYER_LOGGEDIN, true];

private _class = [_playerProfile, KEY_CLASS] call CBA_fnc_hashGet;
private _reputation = [_playerProfile, KEY_REPUTATION] call CBA_fnc_hashGet;
private _money = [_playerProfile, KEY_MONEY] call CBA_fnc_hashGet;

player setVariable [KEY_CLASS, _class];
player setVariable [KEY_REPUTATION, _reputation];
player setVariable [KEY_MONEY, _money];

["stored variables saved in player namespace"], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
