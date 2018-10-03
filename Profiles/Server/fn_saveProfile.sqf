#include "..\constants.hpp"

params [["_playerUid", -1],
        ["_profile", []],
        ["_slot", -1]];

FLOG("saving character to slot %1", _slot);

if(_slot > MAX_PROFILES-1 or _slot < 0) exitWith {
    SLOG("index is out of allowed range. 0 to 2 is allowed");
};

private _allProfiles = call X11_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;

if(_hasNoProfiles) then {
    FLOG("there are no profiles yet set - init with given id %1", _playerUid);
    private _initProfile = [[_playerUid, [EMPTY_HASH, EMPTY_HASH, EMPTY_HASH]]];
    _allProfiles = [_initProfile, EMPTY_HASH] call CBA_fnc_hashCreate;
};

private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;

if(_hasPlayerEntry) then {
    FLOG("found player entry for id %1", _playerUid);

    private _characterProfiles = [_allProfiles, _playerUid] call CBA_fnc_hashGet;

    _characterProfiles set [_slot, _profile];
    [_allProfiles, _playerUid, _characterProfiles] call CBA_fnc_hashSet;

    profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
    saveProfileNamespace;

    FLOG("saved new character at slot %1", _slot);
};


