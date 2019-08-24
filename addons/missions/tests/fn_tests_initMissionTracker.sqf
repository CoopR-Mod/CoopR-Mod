#include "script_component.hpp"

TSTART;
private _actual;

TEST("should assign mission tracker to unit");

player call coopr_fnc_initMissionTracker;
private _actual = player getVariable [COOPR_CHAR_MISSION_TRACKER, EMPTY_HASH];

private _missionStart = [_actual, COOPR_CHAR_MISSION_TRACKER_MISSION_START] call CBA_fnc_hashGet;
private _visitedMissionArea = [_actual, COOPR_CHAR_MISSION_TRACKER_VISITED_MISSION_AREA] call CBA_fnc_hashGet;

TEXPECT(_missionStart, -1);
TEXPECT(_visitedMissionArea, -1);

TEST("should reset already defined mission tracker");

player call coopr_fnc_initMissionTracker;
private _actual = player getVariable [COOPR_CHAR_MISSION_TRACKER, EMPTY_HASH];

private _missionStart = [_actual, COOPR_CHAR_MISSION_TRACKER_MISSION_START] call CBA_fnc_hashGet;
private _visitedMissionArea = [_actual, COOPR_CHAR_MISSION_TRACKER_VISITED_MISSION_AREA] call CBA_fnc_hashGet;

[_actual, COOPR_CHAR_MISSION_TRACKER_MISSION_START, 100] call CBA_fnc_hashSet;
[_actual, COOPR_CHAR_MISSION_TRACKER_VISITED_MISSION_AREA, 100] call CBA_fnc_hashSet;
player setVariable [COOPR_CHAR_MISSION_TRACKER, _actual, true];

player call coopr_fnc_initMissionTracker;

_missionStart = [_actual, COOPR_CHAR_MISSION_TRACKER_MISSION_START] call CBA_fnc_hashGet;
_visitedMissionArea = [_actual, COOPR_CHAR_MISSION_TRACKER_VISITED_MISSION_AREA] call CBA_fnc_hashGet;

TEXPECT(_missionStart, -1);
TEXPECT(_visitedMissionArea, -1);

TEND;
