#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Removes the marker of a given task
 *
 * Arguments:
 * 0: _taskId <STRING> - id of the task where the marker should be removed of
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * ["coopr_task_recon"] call coopr_fn_removeTaskMarker.sqf;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_taskId", ""]];

if (_taskId isEqualTo "") exitWith { ERROR("_taskId was empty") };

if (isServer) then {
    private _markerName = _taskId + "_task_marker";
    DEBUG2("removing task marker: %1", _markerName);
    deleteMarker _markerName;
} else {
    SERVER_ONLY_ERROR;
};
