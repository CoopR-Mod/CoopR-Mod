#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_playerUID"];

[format ["fetching player profiles from server", _playerUID], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _playerProfiles = profileNamespace getVariable [KEY_PLAYER_PROFILES, false];
[format ["retrieved profile is: %1 ", _playerProfiles], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
private _profileExists = [_playerProfiles, _playerUID] call CBA_fnc_hashHasKey;

if(_profileExists) then {
    [_playerProfiles, _playerUID] call CBA_fnc_hashGet;
} else {
    [format ["failed to get profile - uid %1 was not found", _playerUID], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
    false;
};

