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
       // do stuff
    } else {
       DEBUG("player in headquarter has no active task");
    };
    systemChat "||CoopR|| Squad entered headquarters";
};
