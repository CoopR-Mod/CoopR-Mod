
#include "..\constants.hpp"

params ["_player"];

private _allProfiles = call X11_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;

if (_hasNoProfiles) exitWith {
    SLOG("no profiles found - skipping sync");
};

private _isLoggedIn = _player getVariable [KEY_PLAYER_LOGGEDIN, false];

if(_isLoggedIn) then {

    private _slot = _player getVariable [KEY_SLOT, -1];
    private _uid = getPlayerUID _player;
    private _characterSlots = _uid call X11_fnc_getCharacterSlots;
    private _characterState = _player call X11_fnc_createCharacterStateFromPlayer;
    FLOG("syncing player character for slot %1 to server...", _slot);

    _characterSlots set [_slot, _characterState];
    [_allProfiles, _uid, _characterSlots] call CBA_fnc_hashSet;

    FLOG("player %1 manually synced", name _player);
};

profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;
SLOG("... syncing done.");

