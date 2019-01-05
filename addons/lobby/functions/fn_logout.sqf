#include "script_component.hpp"

cutText ["returning to character lobby.", "BLACK OUT", 0.5];
sleep 1;
cutText ["saving character...", "BLACK OUT", 0.0001];
INFO2("player with id %1 is logging out to lobby", getPlayerUid player);
DEBUG("saving character state before logout...");
player call coopr_fnc_updateState;
[EXEC_SERVER, "coopr_fnc_updateCharacter", [player call coopr_fnc_serializeCoopR], //request-related
    [], {
        sleep 4;
        DEBUG("...saved");
        cutText ["...saved!", "BLACK OUT", 0.0001];
        call coopr_fnc_spawnInLobby;
        createDialog "coopr_Login_Dialog";
        call coopr_fnc_initLoginDialog;
    }
] call Promise_Create;

