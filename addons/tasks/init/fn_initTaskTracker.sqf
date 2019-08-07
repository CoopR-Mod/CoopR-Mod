#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This will initialize a task tracker for a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _taskType <STRING> - type of task
 * 2: _target <ARRAY> - target for the task: [_type, _strength]
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_unit] call coopr_fnc_initTaskTracker;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_type", ""],
        ["_target", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };

if (isServer) then {
    private _taskTracker = EMPTY_HASH;

    DEBUG("initialising task tracker");
    // init task tracker
    private _timeStamp = call coopr_fnc_currentGameTime;
    DEBUG2("task started at %1", _timeStamp);
    [_taskTracker, COOPR_KEY_TASK_TRACKER_TASK_START, _timeStamp] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, false] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_KILL_COUNT, 0] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_TYPE, _type] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_TARGET, _target] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_RECON_COMPLETE, false] call CBA_fnc_hashSet;

    ["tasktracker init state:", _taskTracker] call coopr_fnc_logHash;

    _unit setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    DEBUG2("assigned task tracker to %1", _unit);
} else {
    SERVER_ONLY_ERROR(__FILE__);
}

