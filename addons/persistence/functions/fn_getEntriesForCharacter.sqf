#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all entries for a given characterID
 *
 * Arguments:
 * _characterID <NUMBER> - ID of character
 *
 * Return Value:
 * _entries <ARRAY> - all found entries
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterID", -1]];

if (isServer) then {
    if (_characterID isEqualTo -1) exitWith { ERROR("_characterID was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        call coopr_fnc_getEntriesForCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};
