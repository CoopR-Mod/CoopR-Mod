#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Initialized the task system with ALiVE
 *
 * Arguments:
 * 1: _taskItems <ARRAY> - task items the action should be applied to
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_taskItems", []]];

if (_taskItems isEqualTo []) exitWith { ERROR("_taskItems was not defined") };

INFO("using ALiVE task system");

COOPR_TASKS_ACTIVE = true;

[_taskItems] call coopr_fnc_initTaskItems;

