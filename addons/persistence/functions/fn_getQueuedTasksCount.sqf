#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all queued tasks
 *
 * Arguments:
 * 0: _serverID <NUMBER> - server id to filter count
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
params [["_serverID", -1]];

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_serverID] call coopr_fnc_getQueuedTasksCountLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR;
};

