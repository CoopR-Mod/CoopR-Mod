#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pops one of the queued tasks and returns it
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _tasks <ARRAY> - all found tasks for server id
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
        call coopr_fnc_popQueuedTaskLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};

