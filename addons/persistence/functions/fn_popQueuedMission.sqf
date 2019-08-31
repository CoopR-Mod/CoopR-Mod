#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pops one of the queued missions and returns it
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _missions <ARRAY> - all found missions for server id
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
        call coopr_fnc_popQueuedMissionLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

