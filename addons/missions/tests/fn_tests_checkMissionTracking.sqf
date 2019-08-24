#include "script_component.hpp"

TSTART;

private _testMissionTracker = EMPTY_HASH;

TEST("should return false if no timestamp was created");

[_testMissionTracker, COOPR_MISSION_TRACKER_MISSION_START, -1] call CBA_fnc_hashSet;
[_testMissionTracker, COOPR_MISSION_TRACKER_VISITED_MISSION_AREA, -1] call CBA_fnc_hashSet;

private _actual = [_testMissionTracker] call coopr_fnc_checkMissionTracking;
TEXPECT(false, _actual);

TEST("should return true if all timestamp were > 0 and mission time is > minimum");

[_testMissionTracker, COOPR_MISSION_TRACKER_MISSION_START, -1900] call CBA_fnc_hashSet;
[_testMissionTracker, COOPR_MISSION_TRACKER_VISITED_MISSION_AREA, 300] call CBA_fnc_hashSet;

private _actual = [_testMissionTracker] call coopr_fnc_checkMissionTracking;
TEXPECT(true, _actual);

TEND;
