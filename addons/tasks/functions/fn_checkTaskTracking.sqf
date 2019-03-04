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

    private _visitedTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA] call CBA_fnc_hashGet;

    if (_visitedTaskArea < 0) then {
        DEBUG2("$");
        systemChat "||CoopR|| Your squad weren't present in the task area";
         _valid = false;
     };

    private _currentGameTime = call coopr_fnc_currentGameTime;
    private _missionTime = _taskStart - _currentGameTime;
    DEBUG2("mission time was %1", _missionTime);

    if (_missionTime < COOPR_TASK_MIN_TASK_TIME) then {
        DEBUG2("min mission time is %1", COOPR_TASK_MIN_TASK_TIME);
        systemChat "||CoopR|| You returned way too fast from the mission";
        _valid = false;
    };

    _valid; // return value

} else {
    SERVER_ONLY_ERROR;
}

