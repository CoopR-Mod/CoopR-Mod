#include "..\globals.hpp"

params ["_player", "_reputation"];

private _currentReputation = profileNamespace getVariable ["Reputation", 0];

profileNamespace setVariable ["Reputation", _currentReputation + _reputation];
saveProfileNamespace;

[format ["save reputation for player %1 on server profile", name _player], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
