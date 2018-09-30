#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player"];

private _fetchedProfiles = getPlayerUID _player call X11_fnc_getPlayerProfile;

[format ["DEBUG! %1", _fetchedProfiles], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

if ([_fetchedProfiles] call CBA_fnc_hashSize == 0) exitWith {
    ["no profiles found - setting fetched profiles to empty hash", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    [_player, [KEY_PROFILE_FETCHED, EMPTY_HASH]] remoteExec ["setVariable", owner _player];
};

[_player, [KEY_PROFILE_FETCHED, _fetchedProfiles]] remoteExec ["setVariable", owner _player];