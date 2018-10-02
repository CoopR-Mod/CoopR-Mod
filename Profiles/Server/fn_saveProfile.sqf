
#include "..\constants.hpp"

params [["_player", objNull],
        ["_profile", []],
        ["_slot", -1]];

if(_slot > MAX_PROFILES-1 or _slot < 0) exitWith {
    SLOG("index is out of allowed range. 0 to 2 is allowed");
};

private _uid = getPlayerUID _player;
private _allProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];

if(([_allProfiles] call CBA_fnc_hashSize) == 0) then {
  FLOG("no profiles set yet for id %1 - creating new array", _uid);
  private _initProfile = [[_uid, []]];
  _allProfiles = [_initProfile, []] call CBA_fnc_hashCreate;
};

private _playerProfiles = [_allProfiles, _uid] call CBA_fnc_hashGet;

_playerProfiles set [_slot, _profile];
[_allProfiles, _uid, _playerProfiles] call CBA_fnc_hashSet;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;

FLOG("saved new profile for id %1", _uid);

