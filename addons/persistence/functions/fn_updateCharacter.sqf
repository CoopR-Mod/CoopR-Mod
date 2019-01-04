#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates a given character/player object to the specified persistent location (local/official/custom)
 *
 * Arguments:
 * 0: _character <OBJECT> - the object of the actual player/character
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

params [["_character", objNull]];

if (isServer) then {

    if (_character isEqualTo objNull) exitWith { ERROR("_characters was objNull") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        _character call coopr_fnc_updateCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    }
};

true;
