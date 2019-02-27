#include "script_component.hpp"

TSTART;
private _actual;

TEST("should assign task tracker to unit");

player call coopr_fnc_initTaskTracker;
private _actual = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];

private _enterTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA] call CBA_fnc_hashGet;
private _leaveTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA] call CBA_fnc_hashGet;
private _enterHeadquarter = [_actual, COOPR_KEY_TASK_TRACKER_ENTER_BASE] call CBA_fnc_hashGet;
private _leaveHeadquarter = [_actual, COOPR_KEY_TASK_TRACKER_LEAVE_BASE] call CBA_fnc_hashGet;

TEXPECT(_enterTaskArea, -1);
TEXPECT(_leaveTaskArea, -1);
TEXPECT(_enterHeadquarter, -1);
TEXPECT(_leaveHeadquarter, -1);

TEST("should reset already defined task tracker");

player call coopr_fnc_initTaskTracker;
private _actual = player getVariable [COOPR_KEY_TASK_TRACKER, EMPTY_HASH];

private _enterTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA] call CBA_fnc_hashGet;
private _leaveTaskArea = [_actual, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA] call CBA_fnc_hashGet;
private _enterHeadquarter = [_actual, COOPR_KEY_TASK_TRACKER_ENTER_BASE] call CBA_fnc_hashGet;
private _leaveHeadquarter = [_actual, COOPR_KEY_TASK_TRACKER_LEAVE_BASE] call CBA_fnc_hashGet;

[_actual, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, 100] call CBA_fnc_hashSet;
[_actual, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, 100] call CBA_fnc_hashSet;
[_actual, COOPR_KEY_TASK_TRACKER_ENTER_BASE, 100] call CBA_fnc_hashSet;
[_actual, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, 100] call CBA_fnc_hashSet;

player call coopr_fnc_initTaskTracker;

TEXPECT(_enterTaskArea, -1);
TEXPECT(_leaveTaskArea, -1);
TEXPECT(_enterHeadquarter, -1);
TEXPECT(_leaveHeadquarter, -1);

TEND;
