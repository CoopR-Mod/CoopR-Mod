#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all tasks found in the COOPR_TASKS_QUEUE and filtered by given type
 *
 * Arguments:
 * 0: _type <STRING> - Type of task
 *
 * Return Value:
 * None
 *
 * Example:
 * ["coopr_task_type_sniperteam"] call coopr_fnc_getTasksByType;
 *
 * Public: No
 *
 * Scope: SERVER
 */

params [["_type", ""]];

if (_type isEqualTo "") exitWith { ERROR("_type was empty") };

if (isServer) then {
        private _tasksByType = COOPR_TASKS_QUEUE select { ([_x, COOPR_KEY_TASK_TYPE] call CBA_fnc_hashGet) isEqualTo _type };
        if (count _tasksByType == 0) then {
            DEBUG2("no tasks found for type %1", _type);
            [];
        } else {
            DEBUG3("found %1 tasks for type %2", count _tasksByType, _type);
            _tasksByType;
        };
} else {
    SERVER_ONLY_ERROR;
}
