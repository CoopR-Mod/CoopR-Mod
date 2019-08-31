#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Get a data value of a configured perk
 *
 * Arguments:
 * 0: _perkClass <STRING> - class name of the perk to get data from
 * 1: _property <STRING> - data property to get
 *
 * Return Value:
 * _propertyValue <STRING | NUMBER | ARRAY> - perk data
 *
 * Example:
 * ["Sprinter", "description"] call coopr_fn_getPerkData;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_perkClass", ""],
        ["_property", ""]];

if (_perkClass isEqualTo "") then { ERROR("_perkClass was not defined") };
if (_property isEqualTo "") then { ERROR("_property was not defined") };

private _result = objNull;

_result = [(missionConfigFile >> "CfgPerks" >> _perkClass), _property, []] call BIS_fnc_returnConfigEntry;
if (_result isEqualTo []) then {
    _result = [(configFile >> "CfgPerks" >> _perkClass), _property, []] call BIS_fnc_returnConfigEntry;
};

_result; // return
