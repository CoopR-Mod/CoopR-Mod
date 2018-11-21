#include "script_component.hpp"

params [["_playerUid", -1],
        ["_characterState", []],
        ["_slot", -1]];

LSTART("UPDATING CHAR");

if(not ([_characterState] call CBA_fnc_isHash)) exitWith {
    ERROR("characterState has to be a cba hash");
};

if(_slot > MAX_PROFILES-1 or _slot < 0) exitWith {
    ERROR("index is out of allowed range. 0 to 2 is allowed");
    LEND("UPDATING CHAR")
};

FLOG("updating character slot: %1 ...", _slot);

private _characterSlots = _playerUid call coopr_fnc_getCharacterSlots;
_characterSlots set [_slot, _characterState];

[_playerUid, _characterSlots] call coopr_fnc_updateCharacterSlots;

FLOG("character slots updated", _slot);
LEND("UPDATING CHAR");
true; // execution result needed for promise


