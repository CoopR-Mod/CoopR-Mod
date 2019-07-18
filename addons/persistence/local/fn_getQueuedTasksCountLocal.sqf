#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all queued tasks
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
    private _count = format["SELECT count(*) FROM task_queues"];
    (_count call coopr_fnc_extDB3sql) select 0 select 0;
} else {
    SERVER_ONLY_ERROR;
};
