#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts the specified task type. This might be useful for stats or controlling task
 * limits
 *
 * Arguments:
 * 0: _type <STRING> - Type of task
 *
 * Return Value:
 * None
 *
 * Example:
 * ["coopr_task_type_sniperteam"] call coopr_fnc_countTask;
 *
 * Public: No
 *
 * Scope: SERVER
 */

params [["_type", ""]];

if (_type isEqualTo "") exitWith { ERROR("_type was empty") };

if (isServer) then {
    if (isNil "COOPR_COUNTER_TASKS") exitWith {
        ERROR("task counter was not initialized - check tasks module")
    };

    private _prevCount =  [COOPR_COUNTER_TASKS, _type] call CBA_fnc_hashGet;
    private _newCount = prevCount + 1;
    [COOPR_COUNTER_TASKS, _type, _newCount] call CBA_fnc_hashSet;
    DEBUG2("%1 count increased by 1", _type);
} else {
    ERROR("function is only callable on the serverside")
}


