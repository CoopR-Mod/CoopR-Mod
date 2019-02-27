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
    DEBUG("headquarter routine:");
    if (player inArea COOPR_HQ_WEST_BOUNDS) then {
        private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
        if (_isLoggedIn and isPlayer player) then {
            private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
            if (_currentTask isEqualTo []) then {
                DEBUG("player in headquarter has no active task");
            } else {
               private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
               if (isNil "_taskTracker") exitWith {
                   ERROR("player had no tasktracker assigned!");
               };
               systemChat "||CoopR|| Squad entered headquarters";
               DEBUG2("taskTracker is %1", _taskTracker);
            };
        };
    };
};

private _travelRoutine = {
    DEBUG("travel routine:");
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
               DEBUG2("updating task tracker for leaving headquarter with actual timestamp %1", _timeStamp);
               [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, _timeStamp] call CBA_fnc_hashSet;
               player setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
               systemChat "||CoopR|| Squad left headquarters";
            };
        };
    };
};

private _missionRoutine = {
    DEBUG("mission routine:");
    private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
    if !(player inArea COOPR_HQ_WEST_BOUNDS) then {
        if !(_currentTask isEqualType []) then {
            private _taskTracker = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];
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
};

[_headquarterRoutine, COOPR_TIMER_HQ_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
[_travelRoutine, COOPR_TIMER_TRAVEL_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
[_missionRoutine, COOPR_TIMER_MISSION_ROUTINE, []] call CBA_fnc_addPerFrameHandler;

call coopr_fnc_abortButtonEventHandler;

INFO("client events initialized");
