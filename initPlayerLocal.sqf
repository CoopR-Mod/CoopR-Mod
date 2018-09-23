#include "globals.hpp"

params ["_player", "_JIP"];

// local
call X11_fnc_initNpcs;
call X11_fnc_initEventsClient;
call X11_fnc_addPlayerActions;

// server
[getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];

["client initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

