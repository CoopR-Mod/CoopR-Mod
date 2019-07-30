#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized a recon report for a given character
 *
 * Arguments:
 * None
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
        call coopr_fnc_initServerMetaLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};
