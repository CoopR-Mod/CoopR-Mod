#include "script_component.hpp"

params  ["_playerUid", "_characterSlots"];

DEBUG("update character for player %1", _playerUid);

private _allCharacters = call coopr_fnc_getAllCharacters;
[_allCharacters, _playerUid, _characterSlots] call CBA_fnc_hashSet;
profileNamespace setVariable [COOPR_KEY_PLAYER_CHARACTERS, _allCharacters];
saveProfileNamespace;
