#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Helper function to call a promised func
 *
 * Arguments:
 * 0: _functionParams <ARRAY> - all params given to the function
 * 1: _functionName <STRING> - function name to be called async
 * 2: _callbackParams <ARRAY> - all params given to the callback function
 * 3: _callbackFunction <CODE> - the code of the callback function
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_functionParams", []],
        ["_functionName", ""],
        ["_callbackParams", []],
        ["_callbackFunction", {}]];

if (_functionName isEqualTo "") exitWith { ERROR("_functionName was not defined") };

[EXEC_SERVER, _functionName, _functionParams, _callbackParams, _callbackFunction] call Promise_Create;
