#include "..\constants.hpp"

params ["_reputation"];

private _currentReputation = player getVariable [KEY_REPUTATION, 0];
private _charSlot = player getVariable [KEY_SLOT, -1];
[_charSlot, KEY_REPUTATION, _currentReputation + _reputation] call X11_fnc_updateCharacterValue;

