#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will run at the set timing when the player/squad has left the headquarters and is traveling the map
 * Routine timer: COOPR_TIMER_TRAVEL_ROUTINE
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

DEBUG("task routine:");
private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
DEBUG2("task tracker state: %1", _taskTracker);

if !([player] call coopr_fnc_isInHeadquarter) then {
    if !([player] call coopr_fnc_hasActiveTask) then {
        DEBUG("player leaving headquarter without active task. desertion detected");
        [] spawn {sleep 3; player setPos getPos COOPR_HQ_WEST; }
    };
};

if ([player] call coopr_fnc_hasActiveTask) then {
    if ([player] call coopr_fnc_isInTaskArea) then {
        private _timeStamp = call coopr_fnc_currentGameTime;
        [_taskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, _timeStamp] call CBA_fnc_hashSet;
        player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    }
};

