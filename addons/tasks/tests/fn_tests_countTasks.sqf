#include "script_component.hpp"

TSTART;

_cleanup = {
    COOPR_COUNTER_TASKS = EMPTY_HASH;
};

call _cleanup;

TEST("should add a test type to the counter hash");

private _testTaskType = "coopr_test_task_type";
private _beforeCount = [COOPR_COUNTER_TASKS, _testTaskType] call CBA_fnc_hashGet;

[_testTaskType] remoteExec ["coopr_fnc_countTask"];

private _afterCount = [COOPR_COUNTER_TASKS, _testTaskType] call CBA_fnc_hashGet;

TASSERT(_beforeCount == 0);
TASSERT(_afterCount == 1);

TEND;
