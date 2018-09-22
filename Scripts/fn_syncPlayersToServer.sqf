#include "..\globals.hpp"
#include "constants.hpp"

["start syncing player profiles...", DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;
private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];
{
    ["syncing player profile to server...", DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;
    private _player = _x;
    private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];

    // skip if not logged in
    if(_isLoggedIn) then {

        // get the actual player stats
        private _playerHash = _player call X11_fnc_mapPlayerToHash;
        private _uid = [_playerHash, KEY_UID] call CBA_fnc_hashGet;

        // add player profile to hash of profiles
        [_playerProfiles, _uid, _playerHash] call CBA_fnc_hashSet;

        [format ["player %1 synced", name _player], DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;
    }

} forEach allPlayers;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;
["... syncing done.", DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;

