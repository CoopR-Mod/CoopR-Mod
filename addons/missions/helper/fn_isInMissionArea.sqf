#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Helper to extract the boolean mashup for checking if a player/squad is within the mission area marker
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_player", objNull]];

if (_player isEqualTo objNull) exitWith { ERROR("_player was objNull"); };

private _currentMission = player getVariable [COOPR_CHAR_ACTIVE_MISSION, []];
if !(_currentMission isEqualTo []) then {
    private _missionAreaMarker = _currentMission + "_mission_marker";
    DEBUG2("checking is in mission area for %1", _missionAreaMarker);
    getPos player inArea _missionAreaMarker;
};

