#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will control the creation of markers in the context of tasks
 *
 * Arguments:
 * 0: _position <POSITION> - position of the marker
 * 1: _taskId <STRING> - id of the task this marker is created for
 * 2: _taskMarkerType <STRING> - what kind of task marker should be created
 *
 * Return Value:
 * None
 *
 * Example:
 * [_position, "coopr_task_test_0", "RECON"] call coopr_fnc_createTaskMarker;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_position", objNull],
        ["_taskId", ""],
        ["_taskMarkerType", []]];

if (_position isEqualTo objNull) exitWith { ERROR("_position was objNull") };
if (_taskId isEqualTo "") exitWith { ERROR("_taskId was empty string") };
if (_taskMarkerType isEqualTo "") exitWith { ERROR("_taskMarkerType was empty string") };

if (isServer) then {

    switch (_taskMarkerType) do {
        case "RECON": {
            _reconTaskMarker = createMarker [_taskId + "_marker" + "_area", _position];
            _reconTaskMarker setMarkerSize [300, 300];
            _reconTaskMarker setMarkerAlpha 0.5;
            _reconTaskMarker setMarkerColor "ColorRed";
            _reconTaskMarker setMarkerShape "ELLIPSE";
            DEBUG2("recon task marker created: %1", _reconTaskMarker);
        };
        case "INVISIBLE": {
            _invisibleTaskMarker = createMarker [_taskId + "_marker" + "_area", _position];
            _invisibleTaskMarker setMarkerSize [300, 300];
            if (COOPR_DEV_MODE) then {
                _invisibleTaskMarker setMarkerAlpha 0.5;
            } else {
                _invisibleTaskMarker setMarkerAlpha 0;
            };
            _invisibleTaskMarker setMarkerColor "ColorRed";
            _invisibleTaskMarker setMarkerShape "ELLIPSE";
        };
        default {
            _otherMarker = createMarker [_taskId + "_marker" + "_area", _position];
            _otherMarker setMarkerSize [300, 300];
            _otherMarker setMarkerAlpha 0.5;
            _otherMarker setMarkerColor "ColorRed";
            _otherMarker setMarkerShape "ELLIPSE";
            DEBUG2("other task marker created: %1", _otherMarker);
        }
    };

} else {
    SERVER_ONLY_ERROR;
};
