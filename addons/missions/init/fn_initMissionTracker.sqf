#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This will initialize a mission tracker for a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this mission is assigned to
 * 1: _missionType <STRING> - type of mission
 * 2: _target <ARRAY> - target for the mission: [_type, _strength]
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_unit] call coopr_fnc_initMissionTracker;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_type", ""],
        ["_target", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };

if (isServer) then {
    private _missionTracker = EMPTY_HASH;

    DEBUG("initialising mission tracker");
    // init mission tracker
    private _timeStamp = call coopr_fnc_currentGameTime;
    DEBUG2("mission started at %1", _timeStamp);
    [_missionTracker, COOPR_MISSION_TRACKER_MISSION_START, _timeStamp] call CBA_fnc_hashSet;
    [_missionTracker, COOPR_MISSION_TRACKER_VISITED_MISSION_AREA, false] call CBA_fnc_hashSet;
    [_missionTracker, COOPR_MISSION_TRACKER_KILL_COUNT, 0] call CBA_fnc_hashSet;
    [_missionTracker, COOPR_MISSION_TRACKER_TYPE, _type] call CBA_fnc_hashSet;
    [_missionTracker, COOPR_MISSION_TRACKER_TARGET, _target] call CBA_fnc_hashSet;
    [_missionTracker, COOPR_MISSION_TRACKER_RECON_COMPLETE, false] call CBA_fnc_hashSet;

    ["missiontracker init state:", _missionTracker] call coopr_fnc_logHash;

    _unit setVariable [COOPR_MISSION_TRACKER, _missionTracker, true];
    DEBUG2("assigned mission tracker to %1", _unit);
} else {
    SERVER_ONLY_ERROR(__FILE__);
}

