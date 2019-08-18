#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Will serialize a mission into an array
 *
 * Arguments:
 * 0: _missionId <STRING> - ID of the mission that should be serialized
 *
 * Return Value:
 * _serializedMission <ARRAY> - serialized state of the mission
 *
 * Example:
 * ["coopr_mission_recon_0"] call coopr_fnc_serializeMission;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_missionId", ""]];

if (_missionId isEqualTo "") exitWith { ERROR("_missionId was not defined") };

private _serializedMission = [];
_serializedMission pushBack _missionId;

{
  _serializedMission pushBack (_missionId call _x);
} forEach [
    { _this call BIS_fnc_taskDescription },
    //{ _this call BIS_fnc_missionDestination },
    { _this call BIS_fnc_taskState }];

private _serializedMissionMarker = [_missionId + "_mission_marker"] call coopr_fnc_serializeMarker;
_serializedMission pushBack _serializedMissionMarker;

DEBUG("mission serialized");
_serializedMission;
