#include "globals.hpp"

params ["_player", "_JIP"];

// local
call X11_fnc_initNpcs;
call X11_fnc_initEventsClient;
call X11_fnc_addPlayerActions;
call X11_fnc_addPlayerVariables;

// server
[getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", 2];

["client initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

