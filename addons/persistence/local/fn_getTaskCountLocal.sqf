#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all tasks created
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _count <NUMBER> - Amount of tasks created
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    private _countTasks = "SELECT count(*) FROM tasks";
    private _result = (_countTasks call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

