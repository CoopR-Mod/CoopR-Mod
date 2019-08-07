#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates a given character state hash to the specified persistence layer
 *
 * Arguments:
 * 0: _characterHash <ARRAY> - formatted as CBA hash
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_updateCharacter
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterHash", []]];

if (isServer) then {

    if (_characterHash isEqualTo []) exitWith { ERROR("_characters was empty array") };
    if (not ([_characterHash] call CBA_fnc_isHash)) exitWith { ERROR("argument has to be a cba hash"); };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_characterHash] call coopr_fnc_updateCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

