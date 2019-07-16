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
    private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];

    private _isInRecon = player getVariable [COOPR_KEY_IN_RECON, false];
    private _isInTaskArea = [player] call coopr_fnc_isInTaskArea;

    if (_isInRecon and _isInTaskArea) then {
        DEBUG2("running recon routine for character %1", _characterID);
        private _reconTaskId = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
        private _reconTaskMarker = _reconTaskId + "_task_marker";
        private _areaStrengths = [_reconTaskMarker] call coopr_fnc_parseStrengthsInArea;
        private _reportID = [_characterID] call coopr_fnc_getReportIdForCharacterLocal;
        [_reportID, _areaStrengths] call coopr_fnc_setReconAreaActivity;
        COOPR_RECON_ROUTINE_TOGGLE = false; // turn off recon routine
    };
}
