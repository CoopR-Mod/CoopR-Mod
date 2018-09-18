params [_playerUID];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES];

if(_playerProfiles call CBA_fnc_isHash) exitWith {
  [_playerProfiles, _playerUID] call CBA_fnc_hashHasKey;
};
