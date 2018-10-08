#include "..\constants.hpp"

params [
    ["_playerUid", -1]
];

LSTART("FETCH CHAR SLOTS");

private _allProfiles = call X11_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;
private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;

FLOG("retrieving character slots for player %1", _playerUid);
if (_hasNoProfiles) exitWith {
    SLOG("no player profiles found - skipping fetch");
    [EMPTY_HASH, EMPTY_HASH, EMPTY_HASH];
};

if(_hasPlayerEntry) then {
    private _characterSlots = [_allProfiles, _playerUid] call CBA_fnc_hashGet;
    FFLOG("found character slots for id %1: %2", _playerUid, _characterSlots);
    _characterSlots;
} else {
    FLOG("failed to get character slots - no entry for player uid %1 was found", _playerUid);
    [EMPTY_HASH, EMPTY_HASH, EMPTY_HASH];
};

LEND("FETCH CHAR SLOTS");
