#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player", "_reputation"];

private _currentReputation = _player getVariable [KEY_REPUTATION, 0];
_player setVariable [KEY_REPUTATION, _currentReputation + _reputation];

[format ["update reputation for %1 by: %2", name _player, _reputation], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
