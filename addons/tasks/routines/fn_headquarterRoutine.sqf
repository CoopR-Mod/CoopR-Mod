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

DEBUG("headquarter routine:");
private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
DEBUG2("task tracker state: %1", _taskTracker);
if (player inArea COOPR_HQ_WEST_BOUNDS) then {
    private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
    if (_isLoggedIn and isPlayer player) then {
        private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
        if (_currentTask isEqualTo []) then {
            DEBUG("player in headquarter has no active task");
        } else {
           if (_taskTracker isEqualTo []) exitWith {
               ERROR("player had no tasktracker assigned!");
           };
           systemChat "||CoopR|| Squad entered headquarters";
        };
    };
};
