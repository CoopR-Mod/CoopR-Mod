#include "globals.hpp"

params ["_player", "_JIP"];

call X11_fnc_initEventsClient;

["client initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

