#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetch all characters for a given user id (steam_id) by the local database (extDB3)
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

if (_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    DEBUG2("fetch characters for steam id %1", _steamID);
    private _id = _steamID call coopr_fnc_getCharactersIDLocal;
    private _getCharactersForID = format ["SELECT character_0, character_1, character_2 FROM characters WHERE id = %1", _id];
    private _result = _getCharactersForID call coopr_fnc_extDB3sql select 0;
    _result;
} else {
    SERVER_ONLY_ERROR;
};

