#include "script_component.hpp"

params [
    ["_playerUid", -1]
];

LSTART("FETCH CHAR SLOTS");

private _allProfiles = call coopr_fnc_getAllProfiles;
private _hasNoProfiles = ([_allProfiles] call CBA_fnc_hashSize) == 0;
private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;
private _slots = [EMPTY_HASH, EMPTY_HASH, EMPTY_HASH];

FLOG("retrieving character slots for player %1", _playerUid);
if (_hasNoProfiles) then {
    SLOG("no player profiles found - skipping fetch");
};

if(_hasPlayerEntry) then {
    _slots = [_allProfiles, _playerUid] call CBA_fnc_hashGet;
    FLOG("found character slots for id %1", _playerUid);
    //{ [_x] call coopr_fnc_characterStatePrettyLog; } forEach _slots;
} else {
    FLOG("failed to get character slots - no entry for player uid %1 was found", _playerUid);
};

LEND("FETCH CHAR SLOTS");
_slots;
