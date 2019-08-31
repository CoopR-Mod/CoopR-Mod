#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the character_id of the database for the given steam_id
 *
 * Arguments:
 * 0: _steamID <STRING> - the steam id of the user
 *
 * Return Value:
 * charactersID <STRING> - the ID of the characters table for the given user
 *
 * Example:
 * getPlayerUID player call coopr_fnc_getCharacterID
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

if (_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        _steamID call coopr_fnc_getCharactersIDLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

