#include "..\constants.hpp"

_player addEventHandler ["Respawn", {call X11_fnc_addPlayerActions}];

["client events initialized", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

