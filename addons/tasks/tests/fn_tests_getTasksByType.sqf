#include "script_component.hpp"

TSTART;
private _actual;
private _testTask = EMPTY_HASH;

TEST("should return 3 sniper tasks");

_testTask = EMPTY_HASH;
[_testTask, COOPR_KEY_TASK_TYPE, COOPR_TASK_TYPE_SNIPERTEAM] call CBA_fnc_hashSet;
COOPR_TASKS_QUEUE = [];
COOPR_TASKS_QUEUE pushBack _testTask;
COOPR_TASKS_QUEUE pushBack _testTask;
COOPR_TASKS_QUEUE pushBack _testTask;

_actual = [COOPR_TASK_TYPE_SNIPERTEAM] call coopr_fnc_getTasksByType;
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
COOPR_TASKS_QUEUE = [];
COOPR_TASKS_QUEUE pushBack _testTask;
COOPR_TASKS_QUEUE pushBack _testTask;

_actual = [COOPR_TASK_TYPE_SNIPERTEAM] call coopr_fnc_getTasksByType;
TEXPECT(0, count _actual);

TEND;
