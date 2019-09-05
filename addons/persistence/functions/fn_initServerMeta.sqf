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

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        call coopr_fnc_initServerMetaLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
