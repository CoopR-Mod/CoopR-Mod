#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Checks if the cooldown timer (WIA_CD) for a wounded in action character is expired. If yes it will reset the
 * character state to OK (COOPR_STATE_OK). Will iterate over all players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_checkCharacterWIAStates
 *
 * Public: No
 *
 * Scope: Global
 */

if (true ) exitWith {
    ERROR("Implementation missing for __FILE__);
};

{
    private _character = _x;

    if (_character isEqualTo []) exitWith { DEBUG("skipping empty character") };

    private _name = [_character, COOPR_KEY_NAME] call CBA_fnc_hashGet;
    private _state = [_character, COOPR_KEY_STATE] call CBA_fnc_hashGet;
    private _timestamp = [_character, COOPR_KEY_WOUNDED_TIMESTAMP] call CBA_fnc_hashGet;
    private _currentGameTime = call coopr_fnc_currentGameTime;
    private _timeOver =  _currentGameTime >= _timestamp + (WIA_CD * 60);

    if (_state isEqualTo COOPR_STATE_WIA and _timeOver) then {
        [_character, COOPR_KEY_STATE, COOPR_STATE_OK] call CBA_fnc_hashSet;
        [_character] call coopr_fnc_updateCharacterLocal;
        DEBUG2("player %1 was set back to state OK", _name);
    };

} forEach (call coopr_fnc_getAllCharactersLocal);


