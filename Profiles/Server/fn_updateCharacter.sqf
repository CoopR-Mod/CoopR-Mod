#include "..\constants.hpp"

params [["_playerUid", -1],
        ["_characterState", []],
        ["_slot", -1]];

LSTART("UPDATING CHAR");
if(_slot > MAX_PROFILES-1 or _slot < 0) exitWith {
    SLOG("index is out of allowed range. 0 to 2 is allowed");
    LEND("UPDATING CHAR")
};

FLOG("updating character slot: %1...", _slot);

private _characterSlots = _playerUid call X11_fnc_getCharacterSlots;
_characterSlots set [_slot, _characterState];

[_playerUid, _characterSlots] call X11_fnc_updateCharacterSlots;

FLOG("character slots updated", _slot);
LEND("UPDATING CHAR");
true; // execution result needed for promise


