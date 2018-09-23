#include "..\..\globals.hpp"
#include "..\constants.hpp"

private _oldPos = player getVariable [KEY_POSITION, []];

player setPos _oldPos;

[format ["player %1 spawned at old location: %2", getPlayerUID player, _oldPos], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
