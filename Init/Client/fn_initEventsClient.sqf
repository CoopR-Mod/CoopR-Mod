#include "..\constants.hpp"

_onKilled = {
   [] spawn {
       call X11_fnc_death;
        SLOG("saving character before respawn to lobby...");
        [SERVER, "X11_fnc_syncPlayerToServer", [player], //request-related
            [], {
                SLOG("...saved");
                call X11_fnc_spawnInLobby;
                call X11_fnc_showLoginDialog;
            }
        ] call Promise_Create;
   };
};

_onRespawn = {
    call X11_fnc_spawnInLobby;
};

player addEventHandler ["Killed", _onKilled];
player addEventHandler ["Respawn", _onRespawn];

SLOG("client events initialized");
