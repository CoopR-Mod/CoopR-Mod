#include "..\..\globals.hpp"
#include "..\constants.hpp"

_player addEventHandler ["Respawn", {call X11_fnc_addPlayerActions}];

["client events initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;