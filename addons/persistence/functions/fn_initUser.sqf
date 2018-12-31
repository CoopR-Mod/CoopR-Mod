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
    INFO("initializing new user entry");
    private _protocolName = "coopr";
    private _insertCharacters = "INSERT INTO characters (character_1, character_2, character_3) VALUES ('[]', '[]', '[]')";
    private _insertUser = format["INSERT INTO users (steam_id, characters_id) VALUES(%1, LAST_INSERT_ID())", _steamID];

    private _result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _insertCharacters]);
    private _returnCode = _result select 0;

    if(_returnCode isEqualTo 1) then {
        INFO("characters entry created successfully");
    } else {
        ERROR("extDB3: characters could not be created for steamID %1", _steamID);
    };

    _result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _insertUser]);
    _returnCode = _result select 0;

    if(_returnCode isEqualTo 1) then {
        INFO("user entry created successfully");
    } else {
        ERROR("extDB3: user could not be created for steamID %1", _steamID);
    };
}
