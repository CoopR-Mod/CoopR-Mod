
#include "..\constants.hpp"

params ["_player"];

private _allProfiles = call X11_fnc_getAllProfilesSlots;

if ([_allProfiles] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - setting fetched profiles to empty hash");
    [_player, [KEY_PROFILE_FETCHED, EMPTY_HASH]] remoteExec ["setVariable", owner _player];
};

[_player, [KEY_PROFILE_FETCHED, _allProfiles]] remoteExec ["setVariable", owner _player];