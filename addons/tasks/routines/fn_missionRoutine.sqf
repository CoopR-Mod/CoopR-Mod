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

private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];

if (_taskTracker isEqualTo []) exitWith { ERROR("player had no tasktracker assigned!"); };

DEBUG("mission routine:");
DEBUG2("task tracker state: %1", _taskTracker);

if !([player] call coopr_fnc_isInHeadquarter) then {
    if ([player] call coopr_fnc_hasActiveTask) then {
        if ([player] call coopr_fnc_isInTaskArea) then {
            private _leaveBase = [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE] call CBA_fnc_hashGet;
            if (_leaveBase > 0) then {
                private _timeStamp = call coopr_fnc_currentGameTime;
                [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, _timeStamp] call CBA_fnc_hashSet;
                systemChat "||CoopR|| Squad entered the task area";
            } else {
                ERROR("squad has entered task area without ever leaving headquarters");
            };
        };
        player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    };
};
