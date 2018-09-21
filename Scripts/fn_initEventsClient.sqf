#include "..\globals.hpp"
#include "constants.hpp"

_player addEventHandler ["Respawn", {call X11_fnc_addPlayerActions}];
[getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", 2];

["client events initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;