#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will check the amount of counted/checked units and checks if it will fit into the range of a unit
 * strength type (like Fireteam or Squad). This function will return three different NUMBER values.
 *
 * Arguments:
 * 0: _amount <NUMBER> - The amount of units
 * 1: _strengthType <STRING> - A type to check for (Fireteam, Squad, etc.)
 *
 * Return Value:
 * _accuracy <NUMBER>
 *
 * Example:
 * [3, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy; // returns 100
 * [5, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy; // returns 80
 * [10, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy; // returns 100
 * see tests_strengthAccuracy for more examples
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_amount", -1],
        ["_strengthType", ""]];

if (_amount isEqualTo -1) exitWith { ERROR("_amount was locationNull") };
if (_strengthType isEqualTo "") exitWith { ERROR("_strengthType was empty string") };

if (isServer) then {
    if (_amount isEqualTo 0) exitWith { 0 };

    private _accuracy = 100;

    private _minStrength = _strengthType call coopr_fnc_getMinForStrength;
    private _maxStrength = _strengthType call coopr_fnc_getMaxForStrength;

    if (_amount > _maxStrength) then {
        private _offset = (_amount - _maxStrength);
        _accuracy = _accuracy - (_offset * (100 / _maxStrength));
    };
    if (_amount < _minStrength) then {
        private _offset = (_minStrength - _amount);
        _accuracy = _accuracy - (_offset * (100 / _minStrength));
    };

    if (_accuracy < 0) then { _accuracy = 0 };
    ceil _accuracy;

} else {
    ERROR("this function is only allowed on the server side");
}
