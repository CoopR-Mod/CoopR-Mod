#include "..\constants.hpp"

SLOG("start syncing player profiles...");
private _allPlayers = allPlayers;
private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, EMPTY_HASH];

if ([_playerProfiles] call CBA_fnc_hashSize == 0) exitWith {
    SLOG("no profiles found - skipping sync");
};

FLOG("found %1 players", count _allPlayers);
{
    private _player = _x;
    private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];
    private _isRenegade = _player getVariable [KEY_IS_RENEGADE, false];

    // skip if not logged in
    if(_isLoggedIn and not _isRenegade) then {

        SLOG("syncing player profile to server...");
        // get the actual player stats
        private _playerHash = _player call X11_fnc_mapPlayerToHash;
        private _uid = [_playerHash, KEY_UID] call CBA_fnc_hashGet;

        // add player profile to hash of profiles
        [_playerProfiles, _uid, _playerHash] call CBA_fnc_hashSet;

        FLOG("player %1 synced", name _player);
    }

} forEach allPlayers;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
saveProfileNamespace;
SLOG("... syncing done.");

