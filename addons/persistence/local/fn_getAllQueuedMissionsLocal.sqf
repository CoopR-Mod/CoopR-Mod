#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetches all missions from the queue for the global server id
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
    private _allMissionsFromQueue = format["SELECT mission FROM mission_queues WHERE server_id = %1", COOPR_SERVER_ID];
    (_allMissionsFromQueue call coopr_fnc_extDB3sql);
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
