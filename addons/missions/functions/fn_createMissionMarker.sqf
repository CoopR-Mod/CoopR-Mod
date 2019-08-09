#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will control the creation of markers in the context of missions
 *
 * Arguments:
 * 0: _position <POSITION> - position of the marker
 * 1: _missionId <STRING> - id of the mission this marker is created for
 * 2: _missionMarkerType <STRING> - what kind of mission marker should be created
 *
 * Return Value:
 * _markerName <STRING> - name of the created marker
 *
 * Example:
 * [_position, "coopr_mission_test_0", "RECON"] call coopr_fnc_createMissionMarker;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_position", objNull],
        ["_missionId", ""],
        ["_missionMarkerType", []]];

if (_position isEqualTo objNull) exitWith { ERROR("_position was objNull") };
if (_missionId isEqualTo "") exitWith { ERROR("_missionId was empty string") };
if (_missionMarkerType isEqualTo "") exitWith { ERROR("_missionMarkerType was empty string") };

if (isServer) then {

    switch (_missionMarkerType) do {
        case "RECON": {
            _reconMissionMarker = createMarker [_missionId + "_mission_marker", _position];
            _reconMissionMarker setMarkerSize [300, 300];
            _reconMissionMarker setMarkerAlpha 0.5;
            _reconMissionMarker setMarkerColor "ColorRed";
            _reconMissionMarker setMarkerShape "ELLIPSE";
            DEBUG2("recon mission marker created: %1", _reconMissionMarker);
            _reconMissionMarker;
        };
        case "INVISIBLE": {
            _invisibleMissionMarker = createMarker [_missionId + "_mission_marker", _position];
            _invisibleMissionMarker setMarkerSize [300, 300];
            if (COOPR_DEV_MODE) then {
                _invisibleMissionMarker setMarkerAlpha 0.5;
            } else {
                _invisibleMissionMarker setMarkerAlpha 0;
            };
            _invisibleMissionMarker setMarkerColor "ColorRed";
            _invisibleMissionMarker setMarkerShape "ELLIPSE";
            DEBUG2("invisible mission marker created: %1", _invisibleMissionMarker);
            _invisibleMissionMarker;
        };
        default {
            _otherMarker = createMarker [_missionId + "_mission_marker", _position];
            _otherMarker setMarkerSize [300, 300];
            _otherMarker setMarkerAlpha 0.5;
            _otherMarker setMarkerColor "ColorRed";
            _otherMarker setMarkerShape "ELLIPSE";
            DEBUG2("other mission marker created: %1", _otherMarker);
            _otherMarker;
        }
    };

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
