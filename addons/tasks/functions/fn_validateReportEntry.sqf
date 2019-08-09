#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon report entries. This will decide if a recon report will be generated into a mission
 * or not.
 *
 * Arguments:
 * 0: _strength <String> - strength/size of reported unit
 *
 * Return Value:
 * _accuracy <NUMBER> - accuracy for entry strength
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_strength", ""]];
        ["_strengthListForType", []];

if (_strengthListForType isEqualTo []) exitWith { ERROR("_strengthListForType was not defined") };

DEBUG2("strength %1", _strength);
if (_strength in _strengthListForType) then {
    50;
} else {
    0;
}








