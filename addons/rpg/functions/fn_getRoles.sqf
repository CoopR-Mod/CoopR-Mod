#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Return all configured character roles in the format [[<className>, <roleName>], ...]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _roles <ARRAY[ARRAY]> - roles data as [[<className>, <roleName>], ...]
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Global
 */

private _result = [];
private _allRoles = "true" configClasses(missionConfigFile >> "CfgCharacterRoles");
if (_allRoles isEqualTo []) then {
    DEBUG("no CfgCharactersRoles found in missionConfigFile - fallback to configFile");
    _allRoles = "true" configClasses(configFile >> "CfgCharacterRoles");
    {
        private _className = configName _x;
        private _roleName = [(configFile >> "CfgCharacterRoles" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        _result pushBack [_className, _roleName];
    } forEach _allRoles;
} else {
    {
        private _className = configName _x;
        private _roleName = [(missionConfigFile >> "CfgCharacterRoles" >> _className), "name", []] call BIS_fnc_returnConfigEntry;
        _result pushBack [_className, _roleName];
    } forEach _allRoles;
};

_result; // return
