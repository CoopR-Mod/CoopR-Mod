#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUid"];

private _allProfiles = [_playerUid] call X11_fnc_getProfile;

if ([_allProfiles] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - skipping fetch");
    EMPTY_HASH;
};

private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;

if(_hasPlayerEntry) then {
    [_allProfiles, _playerUid] call CBA_fnc_hashGet;
} else {
    FLOG("failed to get profiles - no entry for player uid %1 was found", _allProfiles);
    false;
};

