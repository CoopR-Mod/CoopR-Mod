#include "..\..\constants.hpp"

LSTART("PLAYER KILLED");
if(player getVariable [KEY_STATE, STATE_OK] isEqualTo STATE_OK) then {
    DEBUG("KILL");
    call X11_fnc_death;
    SLOG("saving character before respawn to lobby...");
    [SERVER, "X11_fnc_syncPlayerToServer", [player], //request-related
        [], {
            sleep 3;
            SLOG("...saved");
            call X11_fnc_spawnInLobby;
            createDialog "X11_Login_Dialog";
            call X11_fnc_initLoginDialog;
            LEND("PLAYER KILLED");
        }
    ] call Promise_Create;
}
