#include "globals.hpp"

// debug setup
DEBUG_CFG = [true, true, true];

if (is3DENMultiplayer) then {
    DEBUG_CFG = [true, true, false];
};

call X11_fnc_initEventsServer;

["server initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

