#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check all parameters regarding tasks
 * Routine timer: COOPR_TIMER_TASK_ROUTINE
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

if ([player] call coopr_fnc_hasActiveTask) then {
    DEBUG("task routine running");
    private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
    DEBUG2("tasktracker state: %1", _taskTracker);
    if ([player] call coopr_fnc_isInTaskArea) then {
        private _timeStamp = call coopr_fnc_currentGameTime;
        [_taskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, true] call CBA_fnc_hashSet;
        player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    }
};
