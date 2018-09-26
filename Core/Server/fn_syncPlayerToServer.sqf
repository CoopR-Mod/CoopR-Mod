#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player"];

private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];

["syncing player profile to server...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];

[format ["%1's login state is: %2", name _player, _isLoggedIn], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
// skip if not logged in
if(_isLoggedIn) then {

    // get the actual player stats
    private _playerHash = _player call X11_fnc_mapPlayerToHash;
    // TODO just use getPlayerUID _player here
    private _uid = [_playerHash, KEY_UID] call CBA_fnc_hashGet;

    // add player profile to hash of profiles
    [_playerProfiles, _uid, _playerHash] call CBA_fnc_hashSet;

    [format ["player %1 synced", name _player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
};

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;
["... syncing done.", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

