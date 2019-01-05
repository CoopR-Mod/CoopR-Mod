#include "script_component.hpp"

{
    {
        private _character = _x;

        if (_character isEqualTo []) exitWith { DEBUG("skipping empty character") };
        DEBUG2("checking WIA state for %1", name _player);
        private _state = [_character, COOPR_KEY_STATE] call CBA_fnc_hashGet;
        private _timestamp = [_character, COOPR_KEY_DEATH_TIMESTAMP] call CBA_fnc_hashGet;
        private _timeOver = serverTime >= _timestamp + (WIA_CD * 60);

        if(_state isEqualTo COOPR_STATE_WIA and _timeOver) then {
            [_character, COOPR_KEY_STATE, COOPR_STATE_OK] call CBA_fnc_hashSet;
            _character call coopr_fnc_updateCharacter;
            DEBUG2("player %1 was set back to state OK", name _player);
        };

    } forEach ((getPlayerUID _x) call coopr_fnc_getCharacters);
} forEach allPlayers;


