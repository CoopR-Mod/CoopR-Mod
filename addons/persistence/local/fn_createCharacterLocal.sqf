#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * creates a new character at the given slot in the local (extDB3) database
 *
 * Arguments:
 * 0: _characterState <ARRAY> - the state of a CoopR character
 * 1: _slot <NUMBER> - slot where to create the character (0, 1 or 2)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0] call coopr_fnc_createCharacterLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterState", []],
        ["_slot", -1]];

if(_slot > MAX_CHARACTERS-1 or _slot < 0) exitWith { ERROR("index is out of allowed range. 0 to 2 is allowed"); };
if (_characterState isEqualTo []) exitWith { ERROR("_characterState was empty") };

if (isServer) then {

    DEBUG2("state is %1", _characterState);
    private _playerUID = [_characterState, COOPR_KEY_UID] call CBA_fnc_hashGet;
    DEBUG2("uid is %1", _playerUID);

    if(_playerUID call coopr_fnc_hasUser) then {
        INFO("creating character...");
        private _charactersID = _playerUID call coopr_fnc_getCharactersID;

        private _createCharacter = format["UPDATE characters SET character_%1 = '%2' WHERE id = %3", _slot, _characterState, _charactersID];
        _createCharacter call coopr_fnc_extDB3sql;

        INFO2("character created at slot %1", _slot);
    } else {
        INFO2("skipping character creation - no user for id %1 in database", _playerUID);
    };
};


