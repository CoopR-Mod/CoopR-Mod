#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Will deserialize a task into an array
 *
 * Arguments:
 * 0: _serializedTask <ARRAY> - serialized state of the task
 * 1: _unit <OBJECT> - the unit the task should be deserialized to
 *
 * Return Value:
 * _taskId <STRING> - ID of the deserialized task
 *
 * Example:
 * [_serializedTask, _player] call coopr_fnc_deserializeTask;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_serializedTask", []],["_unit", objNull]];

if (_serializedTask isEqualTo []) exitWith { ERROR("_serializedTask was not defined") };
if (_unit isEqualTo objNull) exitWith { ERROR("_unit was not defined") };

private _taskId = _serializedTask select 0;
private _description = _serializedTask select 1;
private _destination = _serializedTask select 2;
private _serializedMarker = _serializedTask select 3;

private _taskId = [_unit, _taskId , _description, _destination, 1, 2, true] spawn BIS_fnc_taskCreate;
_serializedMarker spawn coopr_fnc_deserializeMarker;

DEBUG3("task %1 deserialized and assigned to %2", _taskId, _unit);
_taskId;
