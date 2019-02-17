#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will check the amount of counted/checked units and checks if it will fit into the range of a unit
 * strength type (like Fireteam or Squad). This function will return three different NUMBER values.
 *
 * Arguments:
 * 0: _actualAmount <NUMBER> - The amount of units
 * 1: _reportedStrength <STRING> - A type to check for (Fireteam, Squad, etc.)
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

params [["_actualAmount", -1],
        ["_reportedStrength", ""]];

if (_actualAmount isEqualTo -1) exitWith { ERROR("_actualAmount was locationNull") };
if (_reportedStrength isEqualTo "") exitWith { ERROR("_reportedStrength was empty string") };
DEBUG2("amount : %1", _actualAmount);
DEBUG2("strengthType : %1", _reportedStrength);

if (isServer) then {
    if (_actualAmount isEqualTo 0) exitWith { 0 };

    private _accuracy = 100;

    private _minStrength = _reportedStrength call coopr_fnc_getMinForStrength;
    private _maxStrength = _reportedStrength call coopr_fnc_getMaxForStrength;

    if (_maxStrength isEqualTo -1 or _minStrength isEqualTo -1) exitWith {
        ERROR("no max or min strength could be determined");
        0;
    };

    DEBUG2("maxStrength : %1", _maxStrength);
    DEBUG2("minStrength : %1", _minStrength);

    if (_actualAmount > _maxStrength) then {
        private _offset = (_actualAmount - _maxStrength);
        DEBUG2("reported strength has positive offset of %1", _offset);
        _accuracy = _accuracy - (_offset * (100 / _maxStrength));
    };
    if (_actualAmount < _minStrength) then {
        private _offset = (_minStrength - _actualAmount);
        DEBUG2("reported strength has negative offset of %1", _offset);
        _accuracy = _accuracy - (_offset * (100 / _minStrength));
    };

    if (_accuracy < 0) then { _accuracy = 0 };
    ceil _accuracy;

} else {
    ERROR("this function can only be executed on the server side");
};
