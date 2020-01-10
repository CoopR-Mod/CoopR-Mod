#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR mission that is applied to the whole group of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this mission is assigned to
 * 1: _cooprMissionInfo <ARRAY/CBA_HASH> - coopr mission containing all infos needed to create a mission
 *
 * Return Value:
 * Boolean - if mission was created successfully
 *
 * Example:
 * [_unit, _cooprMissionInfo] call coopr_fnc_createCooprMission;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_cooprMissionInfo", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_cooprMissionInfo isEqualTo []) exitWith { ERROR("_cooprMissionInfo was []") };

if (isServer) then {
    private _missionType = [_cooprMissionInfo, COOPR_MISSION_TYPE] call CBA_fnc_hashGet;
    private _description = [_cooprMissionInfo, COOPR_MISSION_DESCRIPTION] call CBA_fnc_hashGet;
    private _target = [_cooprMissionInfo, COOPR_MISSION_TARGET] call CBA_fnc_hashGet;
    private _serializedMarkers = [_cooprMissionInfo, COOPR_MISSION_MARKER] call CBA_fnc_hashGet;
    DEBUG3("assigning %1 to unit %2", _missionType, _unit);
    private _missionId = format ["%1_%2", _missionType, (call coopr_fnc_getMissionCount) + 1];
    private _cooprMission = [_unit, _missionId , _missionType, [], 1, 2, true] call BIS_fnc_taskCreate;

    if !(isNil "_cooprMission") then {
        [_unit, _missionType, _target] call coopr_fnc_initMissionTracker;
        DEBUG2("%1 assigned", _cooprMission);
        // TODO: need to be shifted to group/squads
        _unit setVariable [COOPR_CHAR_ACTIVE_MISSION, _missionId, true];
        private _newMarkerName = _missionId + "_recon_marker_";
        { [_x, _newMarkerName + (str _forEachIndex)] call coopr_fnc_deserializeMarker } forEach _serializedMarkers;
        // get the position of the first marker of the mission
        private _deserializedMarkerPos = getMarkerPos (_newMarkerName + "0");
        private _missionMarker = [_deserializedMarkerPos, _missionId, "INVISIBLE"] call coopr_fnc_createMissionMarker;
        [(_cooprMission call coopr_fnc_serializeMission)] spawn coopr_fnc_saveMission;
        true;
    } else {
        ERROR("could not assign mission.");
        false;
    };

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
