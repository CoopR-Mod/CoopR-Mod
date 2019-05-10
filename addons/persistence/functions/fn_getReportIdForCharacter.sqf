#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the report id for a given character
 *
 * Arguments:
 * _characterId <NUMBER> - ID of the character
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterId", -1]];

if (isServer) then {
    if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        call coopr_fnc_getReportIdForCharacterLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};
