
#include "..\constants.hpp"

params ["_player", "_key", "_value"];

//TODO: change to new characterProfiles array
SLOG("updating character value");
private _playerProfiles = [getPlayerUID _player] call X11_fnc_getAllProfiles;
private _uid = getPlayerUID _player;
private _characterProfiles = _uid call X11_fnc_getCharacterSlots;

if !(_characterProfiles isEqualTo false) exitWith {
    [_characterProfiles, _key, _value] call CBA_fnc_hashSet;
    [_playerProfiles, _uid, _characterProfiles] call CBA_fnc_hashSet;

    profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
    saveProfileNamespace;
    SLOG("value updated for profile");
};

SLOG("update failed");

