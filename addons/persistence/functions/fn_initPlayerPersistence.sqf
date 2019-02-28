#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initially creates a user in the database depending on the persistence layer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_initPlayerPersistence
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

if (_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        _steamID call coopr_fnc_initPlayerPersistenceLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};

