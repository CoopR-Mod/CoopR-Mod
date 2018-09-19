params ["_playerUID"];

// create a new player profile
private _newPlayerProfile = [getPlayerUID _player, name _player, "dpl_class_medic", 0, 500] call X11_fnc_createPlayer;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _newPlayerProfile];
saveProfileNamespace;

[format ["player with id %1 is trying to log in", _playerUID], DEBUG_STR_SERVER_SIDE, DEBUG_CFG] call CBA_fnc_debug;
