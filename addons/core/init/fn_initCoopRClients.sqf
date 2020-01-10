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
    DEBUG("initializing client");
    [EXEC_SERVER, "coopr_fnc_initPlayerPersistence", [getPlayerUID player], //request-related
        [], {
            INFO("client initialized");
            DEBUG("calling lobby logic");
            [] spawn {
                waitUntil { !(isNull (findDisplay 46)) };
                [] spawn {
                    call coopr_fnc_spawnInLobby;
                    call coopr_fnc_showLoginDialog
                };
            };
        }
    ] call Promise_Create;
};
