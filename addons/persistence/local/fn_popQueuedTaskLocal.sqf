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
    private _selectLastTaskInQueue = format["SELECT task FROM task_queues WHERE server_id = %1 LIMIT 1;", COOPR_SERVER_ID];
    private _deleteRow = "DELETE FROM task_queues LIMIT 1;";
    private _result = _selectLastTaskInQueue call coopr_fnc_extDB3sql;
    _deleteRow call coopr_fnc_extDB3sql;
    _result select 0 select 0;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
