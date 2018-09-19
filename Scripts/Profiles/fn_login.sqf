#include "../../constants.hpp"

params ["_playerProfile"];

//TODO: set profile parameters

player setVariable [KEY_PLAYER_LOGGEDIN, true];
[format ["player with id %1 logged in", getPlayerUID player], DEBUG_STR_CLIENT_SIDE, DEBUG_CFG] call CBA_fnc_debug;
