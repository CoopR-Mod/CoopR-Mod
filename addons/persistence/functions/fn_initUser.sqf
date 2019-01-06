#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initially creates a user in the database depending on the persitence layer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_initUser
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if(isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        _steamID call coopr_fnc_initUserLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
};

