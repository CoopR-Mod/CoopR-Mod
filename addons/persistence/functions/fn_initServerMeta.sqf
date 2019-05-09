#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized the table entry for this coopr server
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

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        call coopr_fnc_initServerMetaLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};
