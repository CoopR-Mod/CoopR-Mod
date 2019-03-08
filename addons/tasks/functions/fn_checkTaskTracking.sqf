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
    DEBUG("task tracker check:");
    private _valid = true;

    private _taskStart = [_taskTracker, COOPR_KEY_TASK_TRACKER_TASK_START] call CBA_fnc_hashGet;
    private _taskRequirements = [_taskTracker, COOPR_KEY_TASK_TRACKER_TASK_START] call CBA_fnc_hashGet;
    private _visitedTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA] call CBA_fnc_hashGet;

    if (_visitedTaskArea < 0) then {
        DEBUG("failed - was not in target area");
        systemChat "||CoopR|| Your squad weren't present in the task area";
         _valid = false;
    };
    if (_taskRequirements isEqualTo false) then {
        DEBUG("failed - not fulfilled all requirements");
        systemChat "||CoopR|| Your squad did not yet fulfilled all task requirements";
         _valid = false;
    };

    private _currentGameTime = call coopr_fnc_currentGameTime;
    private _missionTime = _currentGameTime - _taskStart;
    DEBUG2("mission time was %1", _missionTime);

    if (_missionTime < COOPR_TASK_MIN_TASK_TIME) then {
        DEBUG("failed - mission time was too short to be logical");
        systemChat "||CoopR|| You returned way too fast from the mission";
        _valid = false;
    };

    _valid; // return value

} else {
    SERVER_ONLY_ERROR;
}

