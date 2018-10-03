#include "..\constants.hpp"

_onKilled = {
    player setVariable [KEY_PLAYER_LOGGEDIN, false, true];
   // [player, KEY_POSITION, getPos respawn_hq] remoteExec ["X11_fnc_setProfileValue", SERVER];
};

_onRespawn = {
    call X11_fnc_spawnInLobby;
};

player addEventHandler ["Killed", _onKilled];
player addEventHandler ["Respawn", _onRespawn];

SLOG("client events initialized");
