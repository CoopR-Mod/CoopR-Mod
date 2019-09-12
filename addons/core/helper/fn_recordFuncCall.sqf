#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This is a debugging function to follow the function call stack and print it to the log on demand
 *
 * Arguments:
 * 0: _isServer <Boolean> - if this func is called on server side or not
 * 1: _funcName <STRING> - func name (usually __FILE__)
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [isServer, __FILE__] call coopr_fn_recordFuncCall;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_isServer", -1],
        ["_funcName", ""],
        ["_cooprTaskInfo", []]];

if (_isServer isEqualTo -1) exitWith { ERROR("_isServer was undefined") };
if (_funcName isEqualTo "") exitWith { ERROR("_funcName was undefined") };

if (isNil "COOPR_DEBUG_FUNC_STACK") then {
    COOPR_DEBUG_FUNC_STACK = [];
    publicVariable "COOPR_DEBUG_FUNC_STACK";
};

private _depth = "";
for "_i" from 0 to (count COOPR_DEBUG_FUNC_STACK) do {
    _depth = _depth + ">";
};

private _msg = _depth + " " + _funcName;
CALL_TRACE(_msg);

COOPR_DEBUG_FUNC_STACK pushBack [_isServer, _funcName];
