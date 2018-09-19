#include "..\globals.hpp"

player addAction ["Register", {[player] remoteExec ["X11_fnc_registerPlayer", 2]}, [], 0.5];

["added register action to player",DEBUG_STR_CLIENT_SIDE , DEBUG_CFG] call CBA_fnc_debug;
