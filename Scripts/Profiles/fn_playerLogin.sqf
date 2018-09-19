#include "constants.hpp"

params ["_target", "_caller", "_actionId", "_args"];

private _playerUID = _args select 0;
private _clientOwnerId = _args select 1;

[format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;

private _foundPlayerProfile = _playerUID call X11_fnc_getPlayerProfile;

if(isNil _foundPlayerProfile) exitWith {
  systemChat "player not found. please register yourself"
  [format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
  remoteExec ["X11_fnc_addRegisterAction"];
};

[_foundPlayerProfile] remoteExec ["X11_fnc_login", _clientOwnerId];
