#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetches all tasks from the queue for the global server id
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
        call coopr_fnc_getAllQueuedTasksLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
    true;
} else {
    SERVER_ONLY_ERROR;
};

