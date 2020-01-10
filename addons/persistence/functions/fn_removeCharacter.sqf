#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Removes a given character state hash to the specified persistence layer
 *
 * Arguments:
 * 0: _steamID <STRING> - steam id of player where character should be removed
 * 1: _slot <NUMBER> - slot position of character to be removed
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPlayerUID player, 1] remoteExec ["coopr_fnc_removeCharacter", 2]
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_steamID", ""], ["_slot", -1]];

if (isServer) then {

    if (_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };
    if (_slot isEqualTo -1) exitWith { ERROR("_slot was -1") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        [_steamID, _slot] call coopr_fnc_removeCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping removal routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};

