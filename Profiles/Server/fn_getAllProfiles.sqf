#include "..\constants.hpp"

SLOG("retrieving player profiles");
private _allProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, EMPTY_HASH];
FLOG("profiles found: %1", [_allProfiles] call CBA_fnc_hashSize);
_allProfiles;
