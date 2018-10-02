
#include "..\constants.hpp"

params ["_player", "_key", "_value"];

//TODO: change to new characters array
["update profile value...", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _playerProfiles = [getPlayerUID _player] call X11_fnc_getAllProfiles;
private _uid = getPlayerUID _player;
private _characters = _uid call X11_fnc_getCharacterSlots;

if !(_characters isEqualTo false) exitWith {
    [_characters, _key, _value] call CBA_fnc_hashSet;
    [_playerProfiles, _uid, _characters] call CBA_fnc_hashSet;

    profileNamespace setVariable [KEY_PLAYER_PROFILES, _playerProfiles];
    saveProfileNamespace;
    SLOG("updating a value for characters");
    ["profile updated", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
};

["update failed", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

