player addAction ["Register", {[getPlayerUID player] remoteExec X11_fnc_registerPlayerProfile}, [], 0.5];


["added register action to player",DEBUG_STR_CLIENT_SIDE , DEBUG_CFG] call CBA_fnc_debug;
