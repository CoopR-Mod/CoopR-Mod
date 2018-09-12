DEBUG_CFG = [true, true, false];

_player addEventHandler ["Respawn", {call X11_fnc_addPlayerActions}];

["Client events initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

