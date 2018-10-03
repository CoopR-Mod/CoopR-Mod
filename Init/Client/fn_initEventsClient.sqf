
#include "..\constants.hpp"

_onConnected = {
    player setVariable [KEY_PLAYER_LOGGEDIN, false, true];
    [player] spawn {sleep 0.5; call X11_fnc_spawnInLobby };
};

_onKilled = {
    player setVariable [KEY_PLAYER_LOGGEDIN, false, true];
   // [player, KEY_POSITION, getPos respawn_hq] remoteExec ["X11_fnc_setProfileValue", SERVER];
};

addMissionEventHandler ["PlayerConnected", _onConnected];
player addEventHandler ["Killed", _onKilled];
player addEventHandler ["Respawn", _onConnected];

SLOG("client events initialized");
