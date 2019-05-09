#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Pushes one CoopR task into the persisted task queue on local
 *
 * Arguments:
 * 0: _cooprTask <CBA-HASH> - coopr task as cba hash
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_cooprTask", []]];

if (isServer) then {
    if (_cooprTask isEqualTo []) exitWith { ERROR("_cooprTask was not defined") };
    if (not ([_cooprTask] call CBA_fnc_isHash)) exitWith { ERROR("_cooprTask has to be a cba hash"); };

    private _taskToQueue = format["INSERT INTO task_queues (server_id, task) VALUES(%1, '%2')", COOPR_SERVER_ID, _cooprTask];
    _taskToQueue call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR;
};
