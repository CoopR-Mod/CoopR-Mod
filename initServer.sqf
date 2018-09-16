#include "global.hpp"

// debug setup
DEBUG_CFG = [false, true, false];

if (is3DENMultiplayer) then {
    DEBUG_CFG = [true, true, false];
};

call X11_fnc_initEventsServer;

["server initialized", DEBUG_STR_SERVER_INIT, DEBUG_CFG] call CBA_fnc_debug;

