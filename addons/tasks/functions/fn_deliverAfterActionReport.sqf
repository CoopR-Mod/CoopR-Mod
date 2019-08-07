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
        private _message = format ["You lost %1 reputation for failing", str _finalRep];
        [[COOPR_LOGO_SMALL], ["After Action Report:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
    };

    if (_validTaskExecution isEqualTo false) then {
        DEBUG("task was not completed");
        [_currentTask, "FAILED"] call BIS_fnc_taskSetState;
        _finalRep = -5;
        private _message = format ["You lost %1 reputation for failing", str _finalRep];
        [[COOPR_LOGO_SMALL], ["After Action Report:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
    };

    if (_validTaskExecution and _fulfilledRequirements) then {
        [_currentTask, "SUCCEEDED"] call BIS_fnc_taskSetState;
        DEBUG("active task removed");
        _finalRep = 10;
        private _message = format ["You gained +%1 reputation", _finalRep];
        [[COOPR_LOGO_SMALL], ["After Action Report:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;

        private _isComplete = [_taskTracker, COOPR_KEY_TASK_TRACKER_RECON_COMPLETE] call CBA_fnc_hashGet;
        if (_isComplete) then {
            DEBUG("report was complete - applying bonus reputation");
            private _bonusRep = 50;
            private _message = format ["You gained +%1 bonus reputation", _bonusRep];
            [[COOPR_LOGO_SMALL], ["Complete Recon Report:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
        } else {
            DEBUG("report was NOT completed");
        };
    };


    // add temp rep points
    [_player, COOPR_REP_AAR_MULTIPLIER] call coopr_fnc_convertTempToReputation;
    _player setVariable [COOPR_KEY_ACTIVE_TASK, []];
    _player setVariable [COOPR_KEY_IN_RECON, false];
    private _characterID = _player getVariable [COOPR_KEY_CHARACTER_ID, -1];
    [_characterID, true] call coopr_fnc_setReportState;

    [_player, _finalRep] call coopr_fnc_updateReputation;
    DEBUG2("adding %1 rep pts to the player", _finalRep);

    // persist change
    _player call coopr_fnc_updateState;
    private _characterHash = _player call coopr_fnc_serializeCoopR;
    [_characterHash] call coopr_fnc_updateCharacter;

    [_currentTask] spawn coopr_fnc_removeTaskMarker;
    // update task state to archive task on server db
    [(_currentTask call coopr_fnc_serializeTask)] spawn coopr_fnc_saveTask;
    [_currentTask] spawn BIS_fnc_deleteTask;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
