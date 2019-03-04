#include "script_component.hpp"

TSTART;
private _actual;

TEST("should assign task tracker to unit");

player call coopr_fnc_initTaskTracker;
private _actual = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];

private _taskStart = [_actual, COOPR_KEY_TASK_TRACKER_TASK_START] call CBA_fnc_hashGet;
private _visitedTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA] call CBA_fnc_hashGet;

TEXPECT(_taskStart, -1);
TEXPECT(_visitedTaskArea, -1);

TEST("should reset already defined task tracker");

player call coopr_fnc_initTaskTracker;
private _actual = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];

private _taskStart = [_actual, COOPR_KEY_TASK_TRACKER_TASK_START] call CBA_fnc_hashGet;
private _visitedTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA] call CBA_fnc_hashGet;

[_actual, COOPR_KEY_TASK_TRACKER_TASK_START, 100] call CBA_fnc_hashSet;
[_actual, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA, 100] call CBA_fnc_hashSet;
player setVariable [COOPR_KEY_TASK_TRACKER, _actual, true];

player call coopr_fnc_initTaskTracker;

_taskStart = [_actual, COOPR_KEY_TASK_TRACKER_TASK_START] call CBA_fnc_hashGet;
_visitedTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_VISITED_TASK_AREA] call CBA_fnc_hashGet;

TEXPECT(_taskStart, -1);
TEXPECT(_visitedTaskArea, -1);

TEND;
