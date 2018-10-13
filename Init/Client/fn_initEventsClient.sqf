#include "..\constants.hpp"

_onKilled = {
   call X11_fnc_logout;
};

_onRespawn = {
    call X11_fnc_spawnInLobby;
};

player addEventHandler ["Killed", _onKilled];
player addEventHandler ["Respawn", _onRespawn];

SLOG("client events initialized");
