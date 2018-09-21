#include "..\globals.hpp"
#include "constants.hpp"

params ["_playerUID", "_clientOwnerId"];

[format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;

private _foundPlayerProfile = _playerUID call X11_fnc_getPlayerProfile;

if(_foundPlayerProfile isEqualTo false) exitWith{
    systemChat "player not found. please register yourself";
};

[format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
[_foundPlayerProfile] remoteExec ["X11_fnc_login", _clientOwnerId];

