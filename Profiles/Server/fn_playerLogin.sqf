#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUID", "_clientOwnerId"];

["login in progress...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _foundPlayerProfile = _playerUID call X11_fnc_getPlayerProfile;

if(_foundPlayerProfile isEqualTo false) exitWith{
    [format ["||Deployed|| profile not found. please register yourself"]] remoteExec ["systemChat", _clientOwnerId];
};

[format ["player with id %1 is logging in", _playerUID], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
[_foundPlayerProfile] remoteExec ["X11_fnc_login", _clientOwnerId];

