#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUID"];

FLOG("fetching player profile for id %1 from server", _playerUID);
private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, EMPTY_HASH];

if ([_playerProfiles] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - skipping fetch");
    EMPTY_HASH;
};

FLOG("retrieved profile is: %1 ", _playerProfiles);
private _profileExists = [_playerProfiles, _playerUID] call CBA_fnc_hashHasKey;

if(_profileExists) then {
    [_playerProfiles, _playerUID] call CBA_fnc_hashGet;
} else {
    FLOG("failed to get profile - uid %1 was not found", _playerProfiles);
    false;
};

