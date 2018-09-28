#include "..\..\globals.hpp"
#include "..\constants.hpp"

params [["_player", objNull],
        ["_profile", []],
        ["_forceRegister", false]];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];
private _alreadyRegistered  = [_playerProfiles, getPlayerUID _player] call CBA_fnc_hashHasKey;

if(_alreadyRegistered and not _forceRegister) exitWith {
    [format ["||Deployed|| already registered with this SteamID. Please login."]] remoteExec ["systemChat", owner _player];
};

private _uid = getPlayerUID _player;
// create new player (stats hash)

// add player profile to hash of profiles
[_playerProfiles, _uid, _profile] call CBA_fnc_hashSet;

["new player added to profiles hash", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;

_player setVariable [KEY_REGISTERED, true];

["new player profile has been set", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
