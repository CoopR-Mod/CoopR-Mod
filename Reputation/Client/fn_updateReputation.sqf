#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_reputation"];

private _currentReputation = player getVariable [KEY_REPUTATION, 0];
player setVariable [KEY_REPUTATION, _currentReputation + _reputation];

[format ["update reputation for %1 by: %2", name player, _reputation], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
