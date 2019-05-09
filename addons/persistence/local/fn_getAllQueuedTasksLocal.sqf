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
    private _allTasksFromQueue = format["SELECT task FROM task_queues WHERE server_id = %1", COOPR_SERVER_ID];
    (_allTasksFromQueue call coopr_fnc_extDB3sql);
} else {
    SERVER_ONLY_ERROR;
};
