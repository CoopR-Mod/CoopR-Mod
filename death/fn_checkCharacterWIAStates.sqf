#include "constants.hpp"

{
    _uid = getPlayerUID _x;
    {
        private _characterSlot = _x;

            private _slot = _forEachIndex;
            private _state = [_characterSlot, KEY_STATE] call CBA_fnc_hashGet;
            private _timestamp = [_characterSlot, KEY_DEATH_TIMESTAMP] call CBA_fnc_hashGet;
            private _timeOver = serverTime >= _timeStamp + (WIA_CD * 60);

            if(_state isEqualTo STATE_WIA and _timeOver) then {
                [_characterSlot, KEY_STATE, STATE_OK] call CBA_fnc_hashSet;
                [_uid, _characterSlot, _slot] call X11_fnc_updateCharacter;
                FLOG("player %1 was set back to state OK", name _player);
            };
    } forEach (_uid call X11_fnc_getCharacterSlots);

} forEach allPlayers;


