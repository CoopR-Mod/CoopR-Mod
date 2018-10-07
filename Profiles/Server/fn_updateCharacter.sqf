#include "..\constants.hpp"

params [["_playerUid", -1],
        ["_characterState", []],
        ["_slot", -1]];

LSTART("UPDATING CHAR");
if(_slot > MAX_PROFILES-1 or _slot < 0) exitWith {
    SLOG("index is out of allowed range. 0 to 2 is allowed");
};

FLOG("updating character slots for slot: %1...", _slot);

private _allProfiles = call X11_fnc_getAllProfiles;
private _hasPlayerEntry = [_allProfiles, _playerUid] call CBA_fnc_hashHasKey;
private _existingCharacterSlots = [];

if (_hasPlayerEntry) then {
    _existingCharacterSlots = [_allProfiles, _playerUid] call CBA_fnc_hashGet;
    SLOG("found existing character slots");
    _existingCharacterSlots set [_slot, _characterState];
}else{
    SLOG("no entry found for player - creating new one");
    _existingCharacterSlots = [EMPTY_HASH, EMPTY_HASH, EMPTY_HASH];
    _existingCharacterSlots set [_slot, _characterState];
};

[_allProfiles, _playerUid, _existingCharacterSlots] call CBA_fnc_hashSet;

profileNamespace setVariable [KEY_PLAYER_PROFILES, _allProfiles];
saveProfileNamespace;

FLOG("character slots updated", _slot);
LEND("UPDATING CHAR")

