#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Removes the marker of a given mission
 *
 * Arguments:
 * 0: _missionId <STRING> - id of the mission where the marker should be removed of
 *
 * Return Value:
 * Boolean - if mission was created successfully
 *
 * Example:
 * ["coopr_mission_recon"] call coopr_fn_removeMissionMarker.sqf;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_missionId", ""]];

if (_missionId isEqualTo "") exitWith { ERROR("_missionId was empty") };

if (isServer) then {
    private _markerName = _missionId + "_mission_marker";
    DEBUG2("removing mission marker: %1", _markerName);
    deleteMarker _markerName;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
