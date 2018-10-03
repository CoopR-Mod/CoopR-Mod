#include "..\constants.hpp"

params [
    ["_playerUid", -1]
];

private _allProfiles = call X11_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;
private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;

FLOG("retrieving character slots for player %1", _playerUid);
if (_hasNoProfiles) exitWith {
    SLOG("no profiles found - skipping fetch");
    [];
};

if(_hasPlayerEntry) then {
    [_allProfiles, _playerUid] call CBA_fnc_hashGet;
} else {
    FLOG("failed to get profiles - no entry for player uid %1 was found", _playerUid);
    [];
};

