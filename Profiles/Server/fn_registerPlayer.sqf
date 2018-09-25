#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player", "_clientOwnerId"];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];
private _alreadyRegistered  = [_playerProfiles, getPlayerUID _player] call CBA_fnc_hashHasKey;

if(_alreadyRegistered) exitWith {
    [format ["||Deployed|| already registered with this SteamID. Please login."]] remoteExec ["systemChat", _clientOwnerId];
};

private _uid = getPlayerUID _player;
// create new player (stats hash)
private _statsHash = [_uid, name _player, "dpl_class_medic", 0, 500, false, 0] call X11_fnc_createPlayerProfile;
// add new player loadout (did not want to write a helluva parameter overkill above)
[_statsHash, KEY_LOADOUT, NEW_PLAYER_LOADOUT] call CBA_fnc_hashSet;
// add player profile to hash of profiles
[_playerProfiles, _uid, _statsHash] call CBA_fnc_hashSet;

["new player added to profiles hash", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;

_player setVariable [KEY_REGISTERED, true];

["new player profile has been set", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
