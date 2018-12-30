#include "script_component.hpp"

if(hasInterface) then {
    call coopr_fnc_initPromise;
    call coopr_fnc_initEventsClient;
    call coopr_fnc_addPlayerActions;

    [] spawn {
        waitUntil { !(isNull (findDisplay 46)) };
        call coopr_fnc_spawnInLobby;
        [] spawn {
            createDialog "coopr_Login_Dialog";
            call coopr_fnc_initLoginDialog
        };
    };

    INFO("client initialized");
};
