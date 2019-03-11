#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Ends the current task and evaluates reputation points and recon reports
 *
 * Arguments:
 * 0: _target <OBJECT> - object the action is bound to
 * 1: _caller <OBJECT> - action caller
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, _caller] call coopr_fnc_deliverAfterActionReport;
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
    systemChat localize "str.coopr.aar.chatter.commander";

    private _currentTask = _player getVariable [COOPR_KEY_ACTIVE_TASK, []];
    private _taskTracker = _player getVariable [COOPR_KEY_TASK_TRACKER, []];

    if (_taskTracker isEqualTo []) exitWith {
        ERROR("_taskTracker was [] - something went wrong here");
    };

    private _validTaskExecution = [_taskTracker] call coopr_fnc_checkTaskTracking;

    if (_validTaskExecution isEqualTo false) then {
        DEBUG("task was not completed");
        systemChat "||CoopR|| You did not yet finished the task";
    } else {
        [_currentTask, "SUCCEEDED"] call BIS_fnc_taskSetState;
        player setVariable [COOPR_KEY_ACTIVE_TASK, []];
        DEBUG("active task removed");
        if (!isNil "_gainedReputation") then {
            DEBUG2("adding %1 rep pts to the player", _gainedReputation);
            systemChat format ["||CoopR|| Reputation received [%1]", _gainedReputation];
        };
    };

} else {
    SERVER_ONLY_ERROR;
};
