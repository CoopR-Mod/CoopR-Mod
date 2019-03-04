#include "script_component.hpp"

TSTART;

private _testTaskTracker = EMPTY_HASH;

TEST("should return false if no timestamp was created");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_TASK_START, -1] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, -1] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(false, _actual);

TEST("should return true if all timestamp were > 0 and mission time is > minimum");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_TASK_START, -1900] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, 300] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(true, _actual);

TEND;
