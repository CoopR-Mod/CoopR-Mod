#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates a given character/player object to the local database (extDB3)
 *
 * Arguments:
 * 0: _character <OBJECT> - the object of the actual player/character
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

params [["_character", objNull]];

if (isServer) then {

    if (_character isEqualTo objNull) exitWith { ERROR("_characters was objNull") };
    private _playerUID = getPlayerUID _character;

    if(_playerUID call coopr_fnc_hasUser) then {
        INFO("updating character...");
        private _characterHash = ["coopr", _character] call coopr_fnc_prefixVariablesToHash;
        private _characterSlot = [_characterHash, COOPR_KEY_SLOT] call CBA_fnc_hashGet;
        private _charactersID = _playerUID call coopr_fnc_getCharactersID;

        private _updateCharacter = format["UPDATE characters SET character_%1 = '%2' WHERE id = %3", _characterSlot, _characterHash, _charactersID];
        _updateCharacter call coopr_fnc_extDB3sql;

        INFO2("character updated at slot %1", _characterSlot);
    } else {
        INFO2("skipping character update - no user for id %1 in database", _playerUID);
    };
};
