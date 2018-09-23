#include "..\..\globals.hpp"
#include "..\constants.hpp"

_onRespawn = {
    call X11_fnc_addPlayerActions;
    [] spawn {sleep 0.1; call X11_fnc_checkPrisonRefugee};
};

_player addEventHandler ["Respawn", _onRespawn];


["client events initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;