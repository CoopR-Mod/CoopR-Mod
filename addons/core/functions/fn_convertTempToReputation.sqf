#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Converts the temp reputation of a unit to fixed reputation by a multiplier
 *
 * Arguments:
 * 0: _target <OBJECT> - object the action is bound to
 * 1: _caller <OBJECT> - action caller
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _multiplier] call coopr_fnc_convertTempToReputation;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_multiplier", 0]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    _tempReputation = _unit getVariable [COOPR_CHAR_TMP_REPUTATION, 0];

    if(_tempReputation != 0) then {
        _tempReputation = ceil (_tempReputation * _multiplier);
        [_unit, _tempReputation] call coopr_fnc_updateReputation;
        _unit setVariable [COOPR_CHAR_TMP_REPUTATION, 0];
        private _message = format ["You gained +%1 from temp reputation", _tempReputation];
        [[COOPR_LOGO_SMALL], ["Temporary Reputation:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
        _tempReputation;
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

