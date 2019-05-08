#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Will serialize a task into an array
 *
 * Arguments:
 * 0: _taskId <STRING> - ID of the task that should be serialized
 *
 * Return Value:
 * _serializedTask <ARRAY> - serialized state of the task
 *
 * Example:
 * ["coopr_task_recon_0"] call coopr_fnc_serializeTask;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_taskId", ""]];

if (_taskId isEqualTo "") exitWith { ERROR("_taskId was not defined") };

private _serializedTask = [];
_serializedTask pushBack _taskId;

{
  _serializedTask pushBack (_taskId call _x);
} forEach [
    { _this call BIS_fnc_taskDescription },
    { _this call BIS_fnc_taskDestination },
    { _this call BIS_fnc_taskState }];

DEBUG("task serialized");
_serializedTask;
