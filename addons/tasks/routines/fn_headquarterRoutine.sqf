#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine is run at the given timing if the player/squad is within the headquarters boundaries
 * Routine timer: COOPR_TIMER_HQ_ROUTINE
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
if (_taskTracker isEqualTo []) exitWith { ERROR("player had no tasktracker assigned!"); };

DEBUG("headquarter routine:");
DEBUG2("task tracker state: %1", _taskTracker);

if ([player] call coopr_fnc_isInHeadquarter) then {
    private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
    if ([player] call coopr_fnc_hasActiveTask) then {
        private _leaveBase = [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE] call CBA_fnc_hashGet;
        private _enterTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA] call CBA_fnc_hashGet;
        private _leaveTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA] call CBA_fnc_hashGet;
        if (_leaveBase > 0 and _enterTaskArea > 0 and _leaveTaskArea > 0) then {
            private _timeStamp = call coopr_fnc_currentGameTime;
            [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, _timeStamp] call CBA_fnc_hashSet;
            DEBUG("squad returned to headquarters after task area has been visited");
            systemChat "||CoopR|| Squad returned to headquarters";
        } else {
            DEBUG("squad is in headquarters and has not yet visited the task area");
        };
    } else {
       DEBUG("player in headquarter has no active task");
    };
};
