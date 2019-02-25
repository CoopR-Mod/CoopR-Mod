#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Orchestrating function for client specific events
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
player addEventHandler ["Killed", {call coopr_fnc_playerKilledHandler}];
player addEventHandler ["Respawn", { call coopr_fnc_addPlayerActions; }];

private _headquarterRoutine = {
    if (player inArea COOPR_HQ_WEST_BOUNDS) then {
        private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
        if (_isLoggedIn and isPlayer player) then {
            private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
            if (_currentTask isEqualTo []) then {
                DEBUG("entering player has no active task");
            } else {
               private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
               private _enterTaskArea = [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA] call CBA_fnc_hashGet;
               if (_enterTaskArea < 0) exitWith {
                   DEBUG("player has not yet visited the task area");
               };
               private _taskCompleted = [_taskTracker] call coopr_fnc_checkTaskTracking;
               if (_taskCompleted) then {
                   DEBUG("player had returned from a task");
               };
            };
        };
    };
};

private _travelRoutine = {
    private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
    private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];

    if !(player inArea COOPR_HQ_WEST_BOUNDS) then {
        if (_isLoggedIn and isPlayer player) then {
            if (_currentTask isEqualType []) then {
                DEBUG("player leaving headquarter without active task. desertion detected");
                player setPos getPos COOPR_HQ_WEST;
            } else {
               private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
               private _timeStamp = call coopr_fnc_currentGameTime;
               [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, _timeStamp] call CBA_fnc_hashSet;
               player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
               DEBUG("updated task tracker for leaving headquarter with actual timestamp %1", _timeStamp);
            };
        };
    };
};

[_headquarterRoutine, COOPR_TIMER_HQ_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
[_travelRoutine, COOPR_TIMER_TRAVEL_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
//[_missionRoutine, COOPR_TIMER_MISSION_ROUTINE, []] call CBA_fnc_addPerFrameHandler;

call coopr_fnc_abortButtonEventHandler;

INFO("client events initialized");
