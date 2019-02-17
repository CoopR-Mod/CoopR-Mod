#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Generates a combat tasks by the given task type
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _taskType <STRING> - type of task to be generated
 * 2: _cooprTaskInfo <ARRAY/CBA_HASH> - coopr task containing all infos needed to create a task
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [_unit, "coopr_task_type_sniperteam", _cooprTaskInfo] call coopr_fnc_generateCombatTask;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_taskType", ""],
        ["_cooprTaskInfo", []]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_taskType isEqualTo "") exitWith { ERROR("_taskType was empty string") };
if (_cooprTaskInfo isEqualTo []) exitWith { ERROR("_cooprTaskInfo was []") };

if (isServer) then {
    DEBUG("generate combat task");

    switch (_taskType) do {
        case COOPR_TASK_TYPE_SNIPERTEAM: {
            DEBUG("generating sniper team task");
            [_unit, _cooprTaskInfo] call coopr_fnc_createSniperteamTask;
        };
        // TODO: add other combat tasks
        default { false };
    };
};
