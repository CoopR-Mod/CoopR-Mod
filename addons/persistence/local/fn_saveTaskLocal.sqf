#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a serialized task to the local database
 *
 * Arguments:
 * 0: _serializedTask <ARRAY> - task details as array
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_saveTaskLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_serializedTask", []]];

if (isServer) then {
    if (_serializedTask isEqualTo []) exitWith { ERROR("_serializedTask was not defined") };
    if ((count _serializedTask) != 4 ) exitWith { ERROR("_serializedTask array format was wrong") };

    INFO("updating task...");
    private _taskId = _serializedTask select 0;
    private _updateTask = format["REPLACE INTO tasks VALUES('%1', '%2')", _taskId, _serializedTask];
    _updateTask call coopr_fnc_extDB3sql;

    INFO2("task %1 updated ", _taskId);
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
