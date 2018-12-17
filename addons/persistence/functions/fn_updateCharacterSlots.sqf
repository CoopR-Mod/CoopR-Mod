#include "script_component.hpp"

params  ["_playerUid", "_characterSlots"];

DEBUG("update profile for player %1", _playerUid);

private _allProfiles = call coopr_fnc_getAllProfiles;
[_allProfiles, _playerUid, _characterSlots] call CBA_fnc_hashSet;
profileNamespace setVariable [COOPR_KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;
