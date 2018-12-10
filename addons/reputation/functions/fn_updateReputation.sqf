#include "script_component.hpp"

params ["_reputation"];

private _currentReputation = player getVariable [COOPR_KEY_REPUTATION, 0];
private _charSlot = player getVariable [COOPR_KEY_SLOT, -1];
player setVariable [COOPR_KEY_REPUTATION, _currentReputation + _reputation];

//TODO: deactivated due race conditions. Need to switch to real DB
//[_charSlot, COOPR_KEY_REPUTATION, _currentReputation + _reputation] call coopr_fnc_updateCharacterValue;

