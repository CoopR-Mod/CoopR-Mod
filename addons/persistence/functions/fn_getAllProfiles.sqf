#include "script_component.hpp"

INFO("retrieving player profiles");
private _allProfiles = profileNamespace getVariable [COOPR_KEY_PLAYER_PROFILES, EMPTY_HASH];

if([_allProfiles] call CBA_fnc_hashSize == 0) then {
    INFO("no profiles found");
    DEBUG("returning empty hash");
}else{
    INFO2("profiles found");
    DEBUG2("%1", [_allProfiles] call CBA_fnc_hashKeys);
};

_allProfiles;
