#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a given character/player object to the specified persistent location (local/official/custom)
 *
 * Arguments:
 * 0: _character <OBJECT> - the object of the actual player/character
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_persistCharacter
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_character", objNull]];

if (isServer) then {

    if (_character isEqualTo objNull) exitWith { ERROR("_characters was objNull") };
    private _playerUID = getPlayerUID _character;
    DEBUG("checking if user has entry in database");

    if(_playerUID call coopr_fnc_hasUser) then {
        INFO("persisting character...");
        private _characterHash = ["coopr", _character] call coopr_fnc_prefixVariablesToHash;
        private _characterSlot = [_characterHash, COOPR_KEY_SLOT] call CBA_fnc_hashGet;
        private _charactersID = _playerUID call coopr_fnc_getCharactersID select 0 select 0; //extDB3 result format [["value"]]

        private _protocolName = "coopr";
        private _createUsersTable = format["UPDATE characters SET character_%1 = '%2' WHERE id = %3", _characterSlot, _characterHash, _charactersID];

        private _result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _createUsersTable]);
        private _returnCode = _result select 0;

        if(_returnCode isEqualTo 1) then {
            INFO3("extDB3: character at slot %1 successfully updated for %2", _characterSlot, _playerUID);
            true;
        } else {
            ERROR("extDB3: character could not be updated");
            false;
        };
    } else {
        INFO2("skipping character perstisting. No user for id %1 in database", _playerUID);
    };
};
