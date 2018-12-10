#include "script_component.hpp"

SLOG("retrieving player profiles");
private _allProfiles = profileNamespace getVariable [COOPR_KEY_PLAYER_PROFILES, EMPTY_HASH];

if([_allProfiles] call CBA_fnc_hashSize == 0) then {
    SLOG("no profiles found at all - returning empty hash");
}else{
    FLOG("profiles found: %1", [_allProfiles] call CBA_fnc_hashKeys);
};

_allProfiles;
