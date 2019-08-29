#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Get a data value of a configured skill
 *
 * Arguments:
 * 0: _skillClass <STRING> - class name of the skill to get data from
 * 1: _property <STRING> - data property to get
 *
 * Return Value:
 * _propertyValue <STRING | NUMBER | ARRAY> - skill data
 *
 * Example:
 * ["SixthSense", "description"] call coopr_fn_getSkillData;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_skillClass", ""],
        ["_property", ""]];

if (_skillClass isEqualTo "") then { ERROR("_skillClass was not defined") };
if (_property isEqualTo "") then { ERROR("_property was not defined") };

private _result = objNull;

DEBUG2("skillclass %1", _skillClass);
_result = [(missionConfigFile >> "CfgSkills" >> _skillClass), _property, []] call BIS_fnc_returnConfigEntry;
if (_result isEqualTo []) then {
    _result = [(configFile >> "CfgSkills" >> _skillClass), _property, []] call BIS_fnc_returnConfigEntry;
};

_result; // return
