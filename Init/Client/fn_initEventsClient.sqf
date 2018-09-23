#include "..\..\globals.hpp"
#include "..\constants.hpp"

_onRespawn = {
    call X11_fnc_addPlayerActions;
};

_player addEventHandler ["Respawn", _onRespawn];

["client events initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
