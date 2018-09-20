#include "..\globals.hpp"

params ["_player", "_clientOwnerId"];

//TODO make show function parameterized (like notification funcs)
private _currentProgess = profileNamespace getVariable [KEY_INTEL_PROGRESS, 0];

[format ["fetching intel progress player %1 from server profile", name _player], DEBUG_STR_INTEL, DEBUG_CFG] call CBA_fnc_debug;
[format ["||Deployed|| Your intel progress is [%1 %]", _currentProgess]] remoteExec ["systemChat", _clientOwnerId];
