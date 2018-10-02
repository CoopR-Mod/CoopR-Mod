#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUID"];

FLOG("fetching player profiles for id %1 from server", _playerUID);
private _allProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, EMPTY_HASH];

if ([_allProfiles] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - skipping fetch");
    EMPTY_HASH;
};

private _hasPlayerEntry = [_allProfiles, _playerUID] call CBA_fnc_hashHasKey;

if(_hasPlayerEntry) then {
    [_allProfiles, _playerUID] call CBA_fnc_hashGet;
} else {
    FLOG("failed to get profiles - no entry for player uid %1 was found", _allProfiles);
    false;
};

