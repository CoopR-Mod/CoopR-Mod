#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * removes a given character state hash to the local database (extDB3)
 *
 * Arguments:
 * 0: _steamID <STRING> - steam id of player where character should be removed
 * 1: _slot <NUMBER> - slot position of character to be removed
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPlayerUID player, 1] remoteExec ["coopr_fnc_removeCharacterLocal", 2]
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_steamID", ""], ["_slot", -1]];

if (isServer) then {

    if (_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };
    if (_slot isEqualTo -1) exitWith { ERROR("_slot was -1") };

    if (_steamID call coopr_fnc_hasUser) then {
        INFO("removing character...");
        private _charactersID = _steamID call coopr_fnc_getCharactersID;

        private _removeCharacter = format["UPDATE characters SET character_%1 = '[]' WHERE id = %2", _slot, _charactersID];
        _removeCharacter call coopr_fnc_extDB3sql;

        INFO2("character removed at slot %1", _slot);
    } else {
        INFO2("skipping character removal - no user for id %1 in database", _steamID);
    };
} else {
    SERVER_ONLY_ERROR;
};
