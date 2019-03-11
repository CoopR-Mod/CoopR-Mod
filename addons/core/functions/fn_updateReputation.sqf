#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Increases/updates the reputation of a character by the given amount
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit that gains the reputation
 * 1: _reputation <NUMBER> - amount to increase the reputation
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, 10] call coopr_fnc_updateReputation;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_reputation", 0]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _currentReputation = _unit getVariable [COOPR_KEY_REPUTATION, 0];
    private _charSlot = _unit getVariable [COOPR_KEY_SLOT, -1];
    _unit setVariable [COOPR_KEY_REPUTATION, _currentReputation + _reputation];

    _unit call coopr_fnc_updateState;
    [_unit call coopr_fnc_serializeCoopR] call coopr_fnc_updateCharacter;
} else {
    SERVER_ONLY_ERROR;
};
