#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates a given character state hash to the local database (extDB3)
 *
 * Arguments:
 * 0: _characterHash <ARRAY> - formatted as CBA hash
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_updateCharacterLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterHash", []]];

if (isServer) then {
    if (_characterHash isEqualTo []) exitWith { ERROR("_characters was empty array") };
    if (not ([_characterHash] call CBA_fnc_isHash)) exitWith { ERROR("argument has to be a cba hash"); };

    private _playerUID = [_characterHash, COOPR_KEY_UID] call CBA_fnc_hashGet;

    if (_playerUID call coopr_fnc_hasUser) then {
        INFO("updating character...");
        private _characterSlot = [_characterHash, COOPR_KEY_SLOT] call CBA_fnc_hashGet;
        private _charactersID = _playerUID call coopr_fnc_getCharactersID;

        private _updateCharacter = format["UPDATE characters SET character_%1 = '%2' WHERE id = %3", _characterSlot, _characterHash, _charactersID];
        _updateCharacter call coopr_fnc_extDB3sql;

        INFO2("character updated at slot %1", _characterSlot);
    } else {
        INFO2("skipping character update - no user for id %1 in database", _playerUID);
    };
} else {
    SERVER_ONLY_ERROR;
};
