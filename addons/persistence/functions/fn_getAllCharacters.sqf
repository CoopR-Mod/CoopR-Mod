#include "script_component.hpp"

INFO("retrieving player characters");
private _allCharacters = profileNamespace getVariable [COOPR_KEY_PLAYER_CHARACTERS, EMPTY_HASH];

if([_allCharacters] call CBA_fnc_hashSize == 0) then {
    INFO("no characters found");
    DEBUG("returning empty hash");
}else{
    INFO2("characters found");
    DEBUG2("%1", [_allCharacters] call CBA_fnc_hashKeys);
};

_allCharacters;
