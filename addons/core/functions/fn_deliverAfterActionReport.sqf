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
 * Scope: Client
 */

params [["_target", objNull], ["_caller", objNull]];

if (_target isEqualTo objNull) exitWith { ERROR("_target was objNull") };
if (_caller isEqualTo objNull) exitWith { ERROR("_caller was objNull") };

private _gainedReputation = COOPR_REP_AAR_MULTIPLIER call coopr_fnc_convertTempToReputation;
systemChat localize "str.coopr.reputation.chatter.aar";

private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
[_currentTask, "SUCCEEDED"] call BIS_fnc_taskSetState;
player setVariable [COOPR_KEY_ACTIVE_TASK, []];
DEBUG("active task removed");

if(!isNil "_gainedReputation") then {
    systemChat format ["||CoopR|| Reputation received [%1]", _gainedReputation];
};
