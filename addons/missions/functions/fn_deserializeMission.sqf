#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Will deserialize a mission into an array
 *
 * Arguments:
 * 0: _serializedMission <ARRAY> - serialized state of the mission
 * 1: _unit <OBJECT> - the unit the mission should be deserialized to
 *
 * Return Value:
 * _missionId <STRING> - ID of the deserialized mission
 *
 * Example:
 * [_serializedMission, _player] call coopr_fnc_deserializeMission;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_serializedMission", []],["_unit", objNull]];

if (_serializedMission isEqualTo []) exitWith { ERROR("_serializedMission was not defined") };
if (_unit isEqualTo objNull) exitWith { ERROR("_unit was not defined") };

private _missionId = _serializedMission select 0;
private _description = _serializedMission select 1;
private _state = _serializedMission select 2;
private _serializedMarker = _serializedMission select 3;

private _mission = [_unit, _missionId , _description, [], 1, 2, true] call BIS_fnc_missionCreate;
[_mission, _state, false] call BIS_fnc_missionSetState;
[_serializedMarker] spawn coopr_fnc_deserializeMarker;

DEBUG3("mission %1 deserialized and assigned to %2", _mission, _unit);
_mission;
