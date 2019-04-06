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

    [] spawn {
        waitUntil { !(isNull (findDisplay 46)) };
        //Here I am awaiting until player exists, making sure everything bellow works and getting rid of some errors on the mainscreen.
        waitUntil {not isNull player};
        [getPlayerUID player] remoteExec ["coopr_fnc_initPlayerPersistence", EXEC_SERVER];
        call coopr_fnc_spawnInLobby;
        [] spawn {
            createDialog "coopr_Login_Dialog";
            call coopr_fnc_showLoginDialog
        };
        // This call is not working 'cause we're creating a new unit when loggin in.
        // call coopr_fnc_addCharacterActions;
    };

    INFO("client initialized");
};
