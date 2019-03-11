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

    if (_taskTracker isEqualTo []) exitWith { ERROR("_taskTracker was [] - something went wrong here"); };

    private _validTaskExecution = [_taskTracker] call coopr_fnc_checkTaskTracking;
    private _fulfilledRequirements = [_player] call coopr_fnc_checkTaskRequirements;
    private _finalRep = 0;

    if (_fulfilledRequirements isEqualTo false) then {
        DEBUG("task requirements not met");
        [_currentTask, "FAILED"] call BIS_fnc_taskSetState;
        _finalRep = -5;
        ["ReputationLost", [str _finalRep, "failing task"]] call BIS_fnc_showNotification;
    };

    if (_validTaskExecution isEqualTo false) then {
        DEBUG("task was not completed");
        [_currentTask, "FAILED"] call BIS_fnc_taskSetState;
        _finalRep = -5;
        ["ReputationLost", [str _finalRep, "failing task"]] call BIS_fnc_showNotification;
    };

    if (_validTaskExecution and _fulfilledRequirements) then {
        [_currentTask, "SUCCEEDED"] call BIS_fnc_taskSetState;
        DEBUG("active task removed");
        _finalRep = 10;
        ["ReputationGained", [str _finalRep, "finishing task"]] call BIS_fnc_showNotification;
    };

    // add temp rep points
    [_player, COOPR_REP_AAR_MULTIPLIER] call coopr_fnc_convertTempToReputation;
    _player setVariable [COOPR_KEY_ACTIVE_TASK, []];

    [_player, _finalRep] call coopr_fnc_updateReputation;
    DEBUG2("adding %1 rep pts to the player", _finalRep);

    // perstist change
    _player call coopr_fnc_updateState;
    private _characterHash = _player call coopr_fnc_serializeCoopR;
    [_characterHash] call coopr_fnc_updateCharacter;

    [_currentTask] call coopr_fnc_removeTaskMarker;
} else {
    SERVER_ONLY_ERROR;
};
