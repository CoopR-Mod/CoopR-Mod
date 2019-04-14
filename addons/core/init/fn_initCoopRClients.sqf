#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Script to run at every client machine at JIP
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Server
 */

if (hasInterface) then {
    //TODO: can be removed?
    call coopr_fnc_initPromise;
    [getPlayerUID player] remoteExec ["coopr_fnc_initPlayerPersistence", EXEC_SERVER];

    [] spawn {
        waitUntil { !(isNull (findDisplay 46)) };
        call coopr_fnc_spawnInLobby;
        [] spawn {
            createDialog "coopr_Login_Dialog";
            call coopr_fnc_showLoginDialog
        };
    };

    INFO("client initialized");
};
