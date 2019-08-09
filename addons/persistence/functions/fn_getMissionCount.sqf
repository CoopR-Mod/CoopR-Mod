#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all missions created
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _count <NUMBER> - Amount of missions created
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
        call coopr_fnc_getMissionCountLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

