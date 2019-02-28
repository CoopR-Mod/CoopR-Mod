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

DEBUG("travel routine:");
private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
DEBUG2("task tracker state: %1", _taskTracker);
if !(player inArea COOPR_HQ_WEST_BOUNDS) then {
    if (_isLoggedIn and isPlayer player) then {
        if (_currentTask isEqualType []) then {
            DEBUG("player leaving headquarter without active task. desertion detected");
            player setPos getPos COOPR_HQ_WEST;
        } else {
           private _timeStamp = call coopr_fnc_currentGameTime;
           DEBUG2("updating task tracker for leaving headquarter with actual timestamp %1", _timeStamp);
           [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, _timeStamp] call CBA_fnc_hashSet;
           player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
           systemChat "||CoopR|| Squad left headquarters";
        };
    };
};

