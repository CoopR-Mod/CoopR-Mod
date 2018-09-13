#include "constants.hpp"

params ["_player", "_JIP"];

call X11_fnc_initNpcs;
call X11_fnc_initEventsClient;

player call X11_fnc_addPlayerActions;
player call X11_fnc_addPlayerVariables;

["client initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

