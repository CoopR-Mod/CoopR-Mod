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
    INFO2("CoopR Version: %1 ", COOPR_VERSION);
    //TODO: can be removed?
    call coopr_fnc_initPromise;
    DEBUG("initializing client");
    [EXEC_SERVER, "coopr_fnc_initPlayerPersistence", [getPlayerUID player], //request-related
        [], {
            INFO("client initialized");
            [] spawn {
                waitUntil { !(isNull (findDisplay 46)) };
                [] spawn {
                    call coopr_fnc_initLobby;
                    call coopr_fnc_spawnInLobby;
                    call coopr_fnc_showLoginDialog;
                };
            };
        }
    ] call Promise_Create;
};
