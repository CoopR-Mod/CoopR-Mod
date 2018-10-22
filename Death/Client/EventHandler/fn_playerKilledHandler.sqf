#include "..\..\constants.hpp"

LSTART("PLAYER KILLED");
if(player getVariable [KEY_STATE, STATE_OK] isEqualTo STATE_OK) then {
    call X11_fnc_death;
    //TODO: no saving until db is ready
    //SLOG("saving character before respawn to lobby...");
    //SLOG("...saved");
    [] spawn {
        sleep 2;
        call X11_fnc_spawnInLobby;
        createDialog "X11_Login_Dialog";
        call X11_fnc_initLoginDialog;
        LEND("PLAYER KILLED");
    };
}
