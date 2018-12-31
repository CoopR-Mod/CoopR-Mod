#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initially creates a user in the database
 *
 * Arguments:
 * 0: steamID <STRING> - the steam id of the connected user
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
if(_steamID call coopr_fnc_hasUser) exitWith { INFO2("user %1 already defined", _steamID)};

if (isServer) then {
    private _protocolName = "coopr";
    private _insertCharacters = "INSERT INTO characters (character_1, character_2, character_3) VALUES ('[]', '[]', '[]')";
    private _insertUser = format["INSERT INTO users (steam_id, characters_id) VALUES(%1, LAST_INSERT_ID())", _steamID];

    private _result = call compile ("extDB3" callExtension format["1:%1:%2", _protocolName, _insertCharacters]);

    if(!(_result isEqualTo "[1,[]]")) then {
        ERROR("extDB3: characters entry could not be created");
    } else {
        INFO("characters entry created successfully");
    };

    _result = call compile ("extDB3" callExtension format["1:%1:%2", _protocolName, _insertUser]);

    if(!(_result isEqualTo "[1,[]]")) then {
        ERROR("extDB3: characters entry could not be created");
    } else {
        INFO("characters entry created successfully");
    };
}
