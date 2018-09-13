#include "..\constants.hpp"

params ["_player"];

_player setVariable ["isRenegade", false];

["player variables added", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

