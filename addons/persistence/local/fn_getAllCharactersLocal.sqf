#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetch all characters from the local database (extDB3)
 *
 * Arguments:
 * None
 *
 * Return Value
 * characters <ARRAY> - all characters regardless of steam id
 *
 * Example:
 * getPlayerUID player call coopr_fnc_getCharacters
 *
 * Public: No
 *
 * Scope: Server
 */

if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    DEBUG2("fetch all characters");
    private _getAllCharacters = format ["SELECT character_0, character_1, character_2 FROM characters", _id];
    private _result = _getAllCharacters call coopr_fnc_extDB3sql select 0;
    _result;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
