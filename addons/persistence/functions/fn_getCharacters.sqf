#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetch all characters for a given user id (steam_id)
 *
 * Arguments:
 * 0: _steamID <STRING> - the steam id of the user
 *
 * Return Value:
 * characters <ARRAY> - the ID of the characters table for the given user
 *
 * Example:
 * getPlayerUID player call coopr_fnc_getCharacters
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if(isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        _steamID call coopr_fnc_getCharactersLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
};

