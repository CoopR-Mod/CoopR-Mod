#include "..\globals.hpp"

params ["_player"];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];

private _uid = getPlayerUID _player;
// create new player (stats hash)
private _statsHash = [_uid, name _player, "dpl_class_medic", 0, 500] call X11_fnc_createPlayerProfile;
// add player profile to hash of profiles
[_playerProfiles, _uid, _statsHash] call CBA_fnc_hashSet;

["new player added to profiles hash", DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;

["new player profile has been set", DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;
