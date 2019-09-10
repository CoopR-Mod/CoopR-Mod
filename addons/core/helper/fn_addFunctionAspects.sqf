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

 * enrichmentMode : 0 = all functions that start with <tagPrefix>
 * enrichmentMode : 1 = only one function as <functionName>
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

params [["_beforeAspect", {}],
        ["_afterAspect", {}],
        ["_enrichmentMode", [], [[0, ""]]]];

if (isNil "IGNORE_FUNCTIONS") then {
    IGNORE_FUNCTIONS = [];
};

if (_beforeAspect isEqualTo {}) exitWith { ERROR("_beforeAspect was not defined") };
if (_afterAspect isEqualTo {}) exitWith { ERROR("_afterAspect was not defined") };
if (_enrichmentMode isEqualTo []) exitWith { ERROR("_enrichmentMode was not defined") };

if (typeName _afterAspect isEqualTo "STRING") then { _beforeAspect = compile _afterAspect };
if !(typeName _afterAspect isEqualTo "CODE") exitWith { ERROR("_afterAspect is not code") };
if (typeName _beforeAspect isEqualTo "STRING") then { _beforeAspect = compile _beforeAspect };
if !(typeName _beforeAspect isEqualTo "CODE") exitWith { ERROR("_beforeAspect is not code") };

private _mode = _enrichmentMode select 0;
private _functionNameOrTags = _enrichmentMode select 1;

private _enrichFunction = {
    params ["_functionSignature"];
    if (_functionSignature in IGNORE_FUNCTIONS) then {
        DEBUG2("ignore function enrichment for %1", _functionSignature);
    } else {
        // preprocess special keywords
        _processedBeforeAspect = [str _beforeAspect, "__FILE_NAME__", _functionSignature] call coopr_fnc_stringReplace;
        _processedAfterAspect = [str _afterAspect, "__FILE_NAME__", _functionSignature] call coopr_fnc_stringReplace;

        private _function = missionNamespace getVariable _functionSignature;
        DEBUG2("enriching function: %1", _functionSignature);

        if !(isNil "_function") then {
            private _enrichedFunction = format ["
                call %1;
                private _returnValue = [nil] apply {_this call %2} param [0, false];
                call %3;
                _returnValue;
            ", _processedBeforeAspect, _function, _processedAfterAspect];
            missionNamespace setVariable [_functionSignature, compile _enrichedFunction];
            IGNORE_FUNCTIONS pushBackUnique _functionSignature;
        };
    }
};

if (_mode isEqualTo FUNCS_BY_TAG) then {
    private _tag = _functionNameOrTags;
    private _fullPrefix = _tag + "_fnc_";

    private _funcCategories = ("true" configClasses(configFile >> "CfgFunctions" >> _tag)) apply { configName _x };
    {
        private _category = _x;
        private _classNames = ("true" configClasses(configFile >> "CfgFunctions" >> _tag >> _category)) apply { configName _x };
        IGNORE_FUNCTIONS append (_classNames select { ([(configFile >> "CfgFunctions" >> _tag >> _category >> _x), "ignoreAspect", 0] call BIS_fnc_returnConfigEntry) > 0 });
    } forEach _funcCategories;
    IGNORE_FUNCTIONS = IGNORE_FUNCTIONS apply { toLower (_fullPrefix + _x) };
    DEBUG2("aspects won't be applied to following functions: %1", IGNORE_FUNCTIONS);

    DEBUG2("enriching functions for tag: %1", (toUpper _tag));
    private _taggedFunctionSignatures = allVariables missionNamespace select {[_fullPrefix, _x] call BIS_fnc_inString };
    { _x call _enrichFunction; } forEach _taggedFunctionSignatures;
};

if (_mode isEqualTo FUNC_NAME) then {
    private _funcName = _functionNameOrTags;
    _funcName call _enrichFunction;
};

