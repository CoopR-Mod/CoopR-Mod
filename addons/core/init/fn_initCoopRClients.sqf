#include "script_component.hpp"

if(hasInterface) then {
    call coopr_fnc_initPromise;
    //TODO: refactor to more abstract init flag
    // only call if persistence init was successful
    if(LOCAL_PERSISTENCE_INIT) then {
        [getPlayerUID player] remoteExec ["coopr_fnc_initUser", EXEC_SERVER];
    };
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
