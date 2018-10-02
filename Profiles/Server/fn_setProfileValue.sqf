
#include "..\constants.hpp"

params ["_player", "_key", "_value"];

["update profile value...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _profiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, false];
private _uid = getPlayerUID _player;
private _playerProfile = _uid call X11_fnc_getProfileSlots;

if !(_playerProfile isEqualTo false) exitWith {
    [_playerProfile, _key, _value] call CBA_fnc_hashSet;
    [_profiles, _uid, _playerProfile] call CBA_fnc_hashSet;

    profileNamespace setVariable [KEY_PLAYER_PROFILES, _profiles];
    saveProfileNamespace;
    ["profile updated", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
};

["update failed", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

