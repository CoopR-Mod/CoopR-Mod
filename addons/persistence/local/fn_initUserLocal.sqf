#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initially creates a user in the local database (extDB3)
 *
 * Arguments:
 * 0: steamID <STRING> - the steam id of the connected user
 *
 * Return Value:
 * None
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_initUserLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };
if(_steamID call coopr_fnc_hasUser) exitWith { INFO2("user %1 already defined", _steamID)};

if (isServer) then {
    INFO("initializing new user entry");

    private _insertCharacters = "INSERT INTO characters (character_0, character_1, character_2) VALUES ('[]', '[]', '[]')";
    private _insertUser = format["INSERT INTO users (steam_id, characters_id) VALUES(%1, LAST_INSERT_ID())", _steamID];

    _insertCharacters call coopr_fnc_extDB3sql;
    _insertUser call coopr_fnc_extDB3sql;

    INFO2("user for steam id %1 initialized", _steamID);
};
