#include "constants.hpp"

params [_playerUID];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES];

if(_playerProfiles call CBA_fnc_isHash) exitWith {
  if([_playerProfiles, _playerUID] call CBA_fnc_hashHasKey) exitWith {
      [_playerProfiles, _playerUID] call CBA_fnc_hashGet;
    };

  [format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_PROFILES, DEBUG_CFG] call CBA_fnc_debug;
};
