#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Initialized the task items for the task module. These items will receive an action
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

DEBUG2("initializing %1 as task items", _taskItems);
{
    private _document = missionNamespace getVariable [_x, objNull];
    if (_document isEqualTo objNull) exitWith { ERROR("given document string could not be found as object")};
    _document addAction [localize "str.coopr.task.action.opentaskboard", { call coopr_fnc_showTaskBoardDialog}, [], 1.5,true,true,""]
} forEach _taskItems;

