#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Return all configured character roles in the format [[<className>, <id>], ...]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _roles <ARRAY[ARRAY]> - roles data as [[<className>, <id>], ...]
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
        private _roleClass = configName _x;
        private _roleId = [(configFile >> "CfgCharacterRoles" >> _roleClass), "id", objNull] call BIS_fnc_returnConfigEntry;
        _result pushBack [_roleClass, _roleId];
    } forEach _allRoles;
} else {
    {
        private _roleClass = configName _x;
        private _roleId = [(missionConfigFile >> "CfgCharacterRoles" >> _roleClass), "id", objNull] call BIS_fnc_returnConfigEntry;
        _result pushBack [_roleClass, _roleId];
    } forEach _allRoles;
};


_result; // return
