#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check all parameters regarding tasks
 * Routine timer: COOPR_TIMER_RECON_ROUTINE
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

if (COOPR_RECON_ROUTINE_TOGGLE) then {
    private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
    if !(_isLoggedIn) exitWith { DEBUG("skipping recon routine - not logged in"); };

    if (player getVariable [COOPR_KEY_IN_RECON, false]) then {
        if (([player] call coopr_fnc_isInTaskArea)) then {
            private _reconTaskId = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
            private _reconTaskMarker = _reconTaskId + "_task_marker";
            private _areaStrengths = [_reconTaskMarker] call coopr_fnc_parseStrengthsInArea;
            private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];
            [_characterID, _areaStrengths] call coopr_fnc_setReconAreaActivity;
            COOPR_RECON_ROUTINE_TOGGLE = false; // turn off recon routine
        }
    };
}
