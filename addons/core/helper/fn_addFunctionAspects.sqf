#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will enrich existing functions with aspects before and after the function call.
 * This way it will remove boilerplate code mostly used for debugging purpose.
 * Aspects add this functionality while making it more difficult to maintain the code base.
 * Only use if really needed!
 *
 * Important: aspect functions will not utilize their return value in any way
 *
 * Arguments:
 * 0: _beforeAspect <STRING | CODE> - before aspect code as string
 * 1: _afterAspect <STRING | CODE> - after aspect code as string
 * 2: _functionTargets <ARRAY> - [<enrichmentMode> (, <functionName> | <tagPrefix> )]

 * enrichmentMode : 0 = all functions in with <tagPrefix>
 * enrichmentMode : 1 = only function as <functionName>
 *
 * Return Value:
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Global
 */

#define FUNCS_BY_TAG 0
#define FUNC_NAME 1

if (isNil "ALREADY_ENRICHED") then {
    ALREADY_ENRICHED = [];
};

params [["_beforeAspect", objNull],
        ["_afterAspect", objNull],
        ["_enrichmentMode", [], [[0, ""]]]];

if (_beforeAspect isEqualTo objNull) then { ERROR("_beforeAspect was not defined") };
if (_afterAspect isEqualTo objNull) then { ERROR("_afterAspect was not defined") };
if (_enrichmentMode isEqualTo []) then { ERROR("_enrichmentMode was not defined") };

if (typeName _afterAspect isEqualTo "STRING") then { _beforeAspect = compile _afterAspect };
if !(typeName _afterAspect isEqualTo "CODE") then { ERROR("_afterAspect is not code") };
if (typeName _beforeAspect isEqualTo "STRING") then { _beforeAspect = compile _beforeAspect };
if !(typeName _beforeAspect isEqualTo "CODE") then { ERROR("_beforeAspect is not code") };

private _mode = _enrichmentMode select 0;
private _functionNameOrTags = _enrichmentMode select 1;

if (_functionNameOrTags in ALREADY_ENRICHED) exitWith { ERROR("can not enrich same function multiple times") };

if (_mode isEqualTo FUNCS_BY_TAG) then {
    DEBUG2("enriching functions by tag: %1", _functionNameOrTags);
    private _taggedFunctionNames = allVariables missionNamespace select {[_functionNameOrTags, _x] call BIS_fnc_inString };
    {
        private _function = missionNamespace getVariable _x;
        private _enrichedFunction = {
            call _beforeAspect;
            private _returnValue = call _function;
            call _afterAspect;
            _returnValue;
        };

        missionNamespace setVariable [_x, _enrichedFunction];
    } forEach _taggedFunctionNames;
};

if (_mode isEqualTo FUNC_NAME) then {
    DEBUG2("enriching function: %1", _functionNameOrTags);
    private _function = missionNamespace getVariable _functionNameOrTags;
    private _enrichedFunction = {
        call _beforeAspect;
        private _returnValue = call _function;
        call _afterAspect;
        _returnValue;
    };
    missionNamespace setVariable [_functionNameOrTags, _enrichedFunction];
};

ALREADY_ENRICHED pushBackUnique _functionNameOrTags;
