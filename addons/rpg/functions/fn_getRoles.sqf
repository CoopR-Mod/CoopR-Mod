#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Return all configure character roles in the format [[<name>, <id>], ...]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _roleData <ARRAY[ARRAY]> - role data as [[<name>, <id>], ...]
 *
 * Example:
 * ["Groupleader", "coopr_task_type_assault", _cooprTaskInfo] call coopr_fn_getRoles;
 *
 * Public: No
 *
 * Scope: Global
 */

private _result = [];
private _allRoles = "true" configClasses(configFile >> "CfgCharacterRoles");

{
    private _roleName = configName _x;
    private _roleId = (configFile >> "CfgCharacterRoles" >> _roleName  >> "id") call BIS_fnc_GetCfgData;
    _result pushBack [_roleName, _roleId];
} forEach _allRoles;

_result; // return
