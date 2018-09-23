#include "..\..\globals.hpp"
#include "..\constants.hpp"

_onRespawn = {
    player setVariable [KEY_PLAYER_LOGGEDIN, false, true];

    [player] spawn {sleep 0.1; call X11_fnc_spawnInLobby };
};

player addEventHandler ["Respawn", _onRespawn];

["client events initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
