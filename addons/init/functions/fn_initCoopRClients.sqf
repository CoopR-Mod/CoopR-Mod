#include "script_component.hpp"

if(hasInterface) then {

    LSTART("INIT CLIENTS");
    call coopr_fnc_initPromise;
    call coopr_fnc_initEventsClient;
    call coopr_fnc_initNpcs;
    call coopr_fnc_initBoxes;
    call coopr_fnc_addPlayerActions;

    [] spawn {
        waitUntil { !(isNull (findDisplay 46)) };
        call coopr_fnc_spawnInLobby;
        [] spawn {
            createDialog "coopr_Login_Dialog";
            call coopr_fnc_initLoginDialog
        };
    };

    ["client initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    LEND("INIT CLIENTS");

}
