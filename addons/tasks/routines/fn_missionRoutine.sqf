#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will run at the set timing when the player/squad is within the mission destination
 * Routine timer: COOPR_TIMER_MISSION_ROUTINE
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

DEBUG("mission routine:");
private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
DEBUG2("task tracker state: %1", _taskTracker);
if !(player inArea COOPR_HQ_WEST_BOUNDS) then {
    if !(_currentTask isEqualType []) then {
        private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
        private _taskDestination = _currentTask call BIS_fnc_taskDestination;
        DEBUG2("task destination is %1", _taskDestination);
        if ((getPos player) inArea (getMarkerPos (_currentTask + "_marker_area"))) then {
            private _timeStamp = call coopr_fnc_currentGameTime;
            [_taskTracker, COOPR_KEY_TASK_TRACKER_TASK_AREA, _timeStamp] call CBA_fnc_hashSet;
            DEBUG2("updating task tracker for entering task area with actual timestamp %1", _timeStamp);
            systemChat "||CoopR|| Squad entered the task area";
        };
        player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    };
};
