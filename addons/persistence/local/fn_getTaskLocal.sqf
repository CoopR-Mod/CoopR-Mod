#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Get task by id from local DB
 *
 * Arguments:
 * 0: _taskId <STRING> - the id of the task
 *
 * Return Value:
 * task <ARRAY> - the task of the id
 *
 * Example:
 * ["coopr_task_recon_0"] call coopr_fnc_getTaskLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_taskId", ""]];

if (_taskId isEqualTo "") exitWith { ERROR("_taskId was not defined") };

if (isServer) then {
    DEBUG2("get task id %1 from local persistence", _taskId);
    private _getTaskId = format ["SELECT taskHash FROM tasks WHERE task_id = '%1'", _taskId];
    private _result = (_getTaskId call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR;
};

