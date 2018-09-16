#include "..\global.hpp"

params ["_player", "_clientOwnerId"];

private _currentReputation = profileNamespace getVariable ["Reputation", 0];

[format ["get reputation for player %1 from server profile", name _player], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
[format ["||Deployed|| Your current reputation is [%1]", _currentReputation]] remoteExec ["systemChat", _clientOwnerId];