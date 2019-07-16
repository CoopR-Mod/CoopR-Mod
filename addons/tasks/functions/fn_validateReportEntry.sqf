#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon report entries. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _type <String> - type of reported unit
 * 0: _strength <String> - strength/size of reported unit
 *
 * Return Value:
 * _isValid <BOOL> - if entry is valid for task conversion
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_type", ""],
        ["_strength", ""]];
        ["_strengthListForType", []];

if (_type isEqualTo "") exitWith { ERROR("_type was not defined") };
if (_strength isEqualTo "") exitWith { ERROR("_strength was not defined") };
if (_strengthListForType isEqualTo []) exitWith { ERROR("_strengthListForType was not defined") };

DEBUG2("strength %1", _strength);
if (_strength in _strengthListForType) then {
    true;
} else {
    false;
}








