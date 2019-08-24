#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Increases kill count for missiontracker of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit the killcount should be raised for
 * 1: _amount <NUMBER> - amount to be raised (optional) - DEFAULT: 1
 *
 * Return Value:
 * Boolean - if mission was created successfully
 *
 * Example:
 * [_unit, 3] call coopr_fnc_increaseKillCount;
 * [_unit] call coopr_fnc_increaseKillCount;
 *
 * Public: No
 *
 * Scope: Global
 */

params[["_unit", objNull], ["_amount", 1]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

private _missionTracker = player getVariable [COOPR_CHAR_MISSION_TRACKER, []];

if (_missionTracker isEqualTo []) exitWith { ERROR("_missionTracker was empty") };

private _actualKillCount = [_missionTracker, COOPR_CHAR_MISSION_TRACKER_KILL_COUNT] call CBA_fnc_hashGet;
private _newKillCount = _actualKillCount + _amount;
[_missionTracker, COOPR_CHAR_MISSION_TRACKER_KILL_COUNT, _newKillCount] call CBA_fnc_hashSet;
DEBUG2("raising kill count by %1", _amount);
_unit setVariable [COOPR_CHAR_MISSION_TRACKER, _missionTracker];
