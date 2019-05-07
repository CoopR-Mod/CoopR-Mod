#include "script_component.hpp"

if (COOPR_DEV_MODE) then {

    TSTART;
    private _actual = 0;
    private _testTask = EMPTY_HASH;

    TEST("should return 3 sniper tasks");

    _testTask = EMPTY_HASH;

    [_testTask, COOPR_KEY_TASK_TYPE, COOPR_TASK_TYPE_SNIPERTEAM] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_DESCRIPTION, "test" ] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_REPORT_TIME, 1000] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_MARKER, "testmaker"] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_ACCURACY, 80] call CBA_fnc_hashSet;

    COOPR_TASKS_QUEUE = [];
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;

    _actual = [COOPR_TASK_TYPE_SNIPERTEAM] call coopr_fnc_getTasksByType;
    [_testTask, COOPR_KEY_TASK_DESCRIPTION, "test" ] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_REPORT_TIME, 1000] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_MARKER, "testmaker"] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_ACCURACY, 80] call CBA_fnc_hashSet;
    TEXPECT(3, count _actual);

    TEST("should return 10 assault tasks");

    _testTask = EMPTY_HASH;
    [_testTask, COOPR_KEY_TASK_TYPE, COOPR_TASK_TYPE_ASSAULT] call CBA_fnc_hashSet;
    COOPR_TASKS_QUEUE = [];
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;

    _actual = [COOPR_TASK_TYPE_ASSAULT] call coopr_fnc_getTasksByType;
    TEXPECT(10, count _actual);
    TEST("should return 0 sniper tasks");

    _testTask = EMPTY_HASH;
    [_testTask, COOPR_KEY_TASK_TYPE, COOPR_TASK_TYPE_ASSAULT] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_DESCRIPTION, "test" ] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_REPORT_TIME, 1000] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_MARKER, "testmaker"] call CBA_fnc_hashSet;
    [_testTask, COOPR_KEY_TASK_ACCURACY, 80] call CBA_fnc_hashSet;

    COOPR_TASKS_QUEUE = [];
    COOPR_TASKS_QUEUE pushBack _testTask;
    COOPR_TASKS_QUEUE pushBack _testTask;

    _actual = [COOPR_TASK_TYPE_SNIPERTEAM] call coopr_fnc_getTasksByType;
    TEXPECT(0, count _actual);

    COOPR_TASKS_QUEUE = [];

    TEND;
}
