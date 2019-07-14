#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Initialized the task system with CoopR
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

INFO("using CoopR task system");
ERROR("CoopR task system not yet implemented - task system disabled");

