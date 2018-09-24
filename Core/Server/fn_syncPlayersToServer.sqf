#include "..\..\globals.hpp"
#include "..\constants.hpp"

["start syncing player profiles...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _allPlayers = allPlayers;
private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, [] call CBA_fnc_hashCreate];

[format ["found %1 players", count _allPlayers], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

{
    ["syncing player profile to server...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    private _player = _x;
    private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];
    private _isRenegade = _player getVariable [KEY_IS_RENEGADE, false];

    [format ["%1's login state is: %2", name _player, _isLoggedIn], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    [format ["%1's prison state is: %2", name _player, _isRenegade], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

    // skip if not logged in
    if(_isLoggedIn and not _isRenegade) then {

        // get the actual player stats
        private _playerHash = _player call X11_fnc_mapPlayerToHash;
        private _uid = [_playerHash, KEY_UID] call CBA_fnc_hashGet;

        // add player profile to hash of profiles
        [_playerProfiles, _uid, _playerHash] call CBA_fnc_hashSet;

        [format ["player %1 synced", name _player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    }

} forEach allPlayers;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;
["... syncing done.", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

