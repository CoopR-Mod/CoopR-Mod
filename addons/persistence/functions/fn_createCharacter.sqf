#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * creates a new character at the given slot
 *
 * Arguments:
 * 0: _characterState <ARRAY> - the state of a CoopR character
 * 1: _slot <NUMBER> - slot where to create the character (0, 1 or 2)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0] call coopr_fnc_createCharacter
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterState", []],
        ["_slot", -1]];

if (isServer) then {

    if (_characterState isEqualTo []) exitWith { ERROR("_characterState was empty") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_characterState, _slot] call coopr_fnc_createCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};

