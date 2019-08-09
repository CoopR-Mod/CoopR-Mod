#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all queued missions
 *
 * Arguments:
 * 0: _serverID <NUMBER> - server id to filter count
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
params [["_serverID", -1]];

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_serverID] call coopr_fnc_getQueuedMissionsCountLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

