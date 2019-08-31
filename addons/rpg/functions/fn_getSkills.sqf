#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Return all configured skills in the format [[<className>, <skillName>], ...]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _skills <ARRAY[ARRAY]> - skills data as [[<className>, <skillName>], ...]
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Global
 */

private _result = [];
private _allSkills = "true" configClasses(missionConfigFile >> "CfgSkills");
if (_allSkills isEqualTo []) then {
    _allSkills = "true" configClasses(configFile >> "CfgSkills");
    {
        private _className = toLower (configName _x);
        private _skillName = [(configFile >> "CfgSkills" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        if !(_className isEqualTo toLower("CoopR_BaseSkill")) then {
            _result pushBack [_className, _skillName];
        }
    } forEach _allSkills;
} else {
    {
        private _className = configName _x;
        private _skillName = [(missionConfigFile >> "CfgSkills" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        if !(_className isEqualTo toLower("CoopR_BaseSkill")) then {
            _result pushBack [_className, _skillName];
        }
    } forEach _allSkills;
};

_result; // return
