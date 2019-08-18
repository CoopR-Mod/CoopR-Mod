#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Get a data value of a defined role class
 *
 * Arguments:
 * 0: _roleClass <STRING> - class name of role to get data from
 * 1: _property <STRING> - data property to get
 *
 * Return Value:
 * _propertyValue <STRING | NUMBER | ARRAY> - role data
 *
 * Example:
 * ["Groupleader", "coopr_task_type_assault", _cooprTaskInfo] call coopr_fn_getRoles;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_roleClass", ""],
        ["_property", ""]];

if (_roleClass isEqualTo "") then { ERROR("_roleClass was not defined") };
if (_property isEqualTo "") then { ERROR("_property was not defined") };

private _result = objNull;

_result = [(missionConfigFile >> "CfgCharacterRoles" >> _roleClass), _property, []] call BIS_fnc_returnConfigEntry;
if (_result isEqualTo []) then {
    DEBUG("no CfgCharactersRoles found in missionConfigFile - fallback to configFile");
    _result = [(configFile >> "CfgCharacterRoles" >> _roleClass), _property, []] call BIS_fnc_returnConfigEntry;
};

_result; // return
