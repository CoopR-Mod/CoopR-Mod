#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will return true if the given task tracker has valid tracking values for a tracked task.
 * This implies all situation like leaving a base, entering a target/task destination area and leaving it etc.
 * Also this will check if the time delta between those time stamps is reasonable. If a task is like 10 miles away
 * from the headquarters it is like impossible to have timestamp deltas less than a minute. The tracker should avoid
 * exploitation or cheating by teleporting etc.
 *
 * Arguments:
 * 0: _taskTracker <CBA_HASH> - tracker to evaluate
 *
 * Return Value:
 * Boolean - if task tracking was valid
 *
 * Example:
 * [_traskTracker] call coopr_fnc_alive_checkTaskTracking;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_taskTracker", []]];

if (_taskTracker isEqualTo []) exitWith { ERROR("_taskTracker was objNull") };

if (isServer) then {
    private _valid = true;

    private _leaveBase = [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE] call CBA_fnc_hashGet;
    private _enterTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA] call CBA_fnc_hashGet;
    private _leaveTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA] call CBA_fnc_hashGet;
    private _enterBase = [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE] call CBA_fnc_hashGet;

    if (_leaveBase < 0) then { _valid = false; };
    if (_enterTaskArea < 0) then { _valid = false; };
    if (_leaveTaskArea < 0) then { _valid = false; };
    if (_enterBase < 0) then { _valid = false; };

    private _missionTime = _enterBase - _leaveBase;
    DEBUG2("mission time delta was %1", _missionTime);
    DEBUG2("min mission time is %1", COOPR_TASK_MIN_MISSIONTIME);

    if (_missionTime < COOPR_TASK_MIN_MISSIONTIME) then {
        _valid = false;
    };

    _valid; // return value

} else {
    SERVER_ONLY_ERROR;
}

