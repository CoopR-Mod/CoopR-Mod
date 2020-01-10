#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Checks if the current user (steam_id) is already in the database
 *
 * Arguments:
 * 0: steamID <STRING> - the steam id of the connected user
 *
 * Return Value:
 * isAvailable <BOOLEAN>
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_hasPlayer
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

//TODO: refactor to macro
if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        _steamID call coopr_fnc_hasPlayerLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

