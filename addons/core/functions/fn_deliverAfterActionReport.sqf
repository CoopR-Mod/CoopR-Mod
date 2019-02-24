#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Ends the current task and evaluates reputation points and recon reports
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [player] call coopr_fnc_alive_createReconTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_target", objNull], ["_caller", objNull]];

if (_target isEqualTo objNull) exitWith { ERROR("_target was objNull") };
if (_caller isEqualTo objNull) exitWith { ERROR("_caller was objNull") };

if (isServer) then {
    private _player = _caller;
    private _gainedReputation = COOPR_REP_AAR_MULTIPLIER call coopr_fnc_convertTempToReputation;
    systemChat localize "str.coopr.reputation.chatter.aar";

    private _currentTask = _player getVariable [COOPR_KEY_ACTIVE_TASK, []];
    private _taskTracker = _player getVariable [COOPR_KEY_TASK_TRACKER, []];

    if (_taskTracker isEqualTo []) exitWith {
        ERROR("_taskTracker was [] - something went wrong here");
    };

    private _taskCompleted = [_taskTracker] call coopr_fnc_checkTaskTracking;

    if (_taskCompleted isEqualTo false) then {
        DEBUG("task was not completed");
        systemChat "||CoopR|| You did not yet finished the task";
    };

    [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, -1] call CBA_fnc_hashSet;

    [_currentTask, "SUCCEEDED"] call BIS_fnc_taskSetState;
    player setVariable [COOPR_KEY_ACTIVE_TASK, []];
    DEBUG("active task removed");

    if (!isNil "_gainedReputation") then {
        systemChat format ["||CoopR|| Reputation received [%1]", _gainedReputation];
    };

} else {
    SERVER_ONLY_ERROR;
};
