#include "script_component.hpp"

TSTART;

private _testTaskTracker = EMPTY_HASH;

TEST("should return false if no timestamp was created");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, -1] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, -1] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, -1] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, -1] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(false, _actual);

TEST("should return true if all timestamp were > 0 and mission time is > minimum");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, COOPR_TASK_MIN_MISSIONTIME + 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, 200] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, 300] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(true, _actual);

TEST("should return false if only leaving and entering the base has timestamps");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, COOPR_TASK_MIN_MISSIONTIME + 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, -1] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, -1] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(false, _actual);

TEST("should return false if return to base was faster than minimum mission time");

[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, COOPR_TASK_MIN_MISSIONTIME - 100] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, 200] call CBA_fnc_hashSet;
[_testTaskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, 300] call CBA_fnc_hashSet;

private _actual = [_testTaskTracker] call coopr_fnc_checkTaskTracking;
TEXPECT(false, _actual);

TEND;
