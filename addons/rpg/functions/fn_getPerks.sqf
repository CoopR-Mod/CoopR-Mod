#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Return all configured perks in the format [[<className>, <perkName>], ...]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _roles <ARRAY[ARRAY]> - roles data as [[<className>, <perkName>], ...]
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Global
 */

private _result = [];
private _allPerks = "true" configClasses(missionConfigFile >> "CfgPerks");
if (_allPerks isEqualTo []) then {
    _allPerks = "true" configClasses(configFile >> "CfgPerks");
    {
        private _className = toLower (configName _x);
        private _perkName = [(configFile >> "CfgPerks" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        if !(_className isEqualTo toLower("CoopR_BasePerk")) then {
            _result pushBack [_className, _perkName];
        }
    } forEach _allPerks;
} else {
    {
        private _className = configName _x;
        private _perkName = [(missionConfigFile >> "CfgPerks" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        if !(_className isEqualTo toLower("CoopR_BasePerk")) then {
            _result pushBack [_className, _perkName];
        }
    } forEach _allPerks;
};

_result; // return
