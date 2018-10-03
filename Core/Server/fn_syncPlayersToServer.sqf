#include "..\constants.hpp"

SLOG("start syncing player profiles...");
private _allPlayers = allPlayers;
private _allProfiles = call X11_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;

if (_hasNoProfiles) exitWith {
    SLOG("no profiles found - skipping sync");
};

FLOG("found %1 players", count _allPlayers);
{
    private _player = _x;
    private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];
    private _isRenegade = _player getVariable [KEY_IS_RENEGADE, false];

    // skip if not logged in
    if(_isLoggedIn and not _isRenegade) then {

        private _slot = _player getVariable [KEY_SLOT, -1];
        private _uid = getPlayerUID _player;
        private _characterSlots = _uid call X11_fnc_getCharacterSlots;
        private _characterState = _player call X11_fnc_mapPlayerToHash;
        FLOG("syncing player character for slot %1 to server...", _slot);

        _characterSlots set [_slot, _characterState];
        [_allProfiles, _uid, _characterSlots] call CBA_fnc_hashSet;

        FLOG("player %1 synced", name _player);
    }

} forEach allPlayers;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;
SLOG("... syncing done.");

