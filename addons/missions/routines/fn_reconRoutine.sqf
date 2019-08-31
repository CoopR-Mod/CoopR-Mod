#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check all parameters regarding missions
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
    private _isLoggedIn = player getVariable [COOPR_CHAR_PLAYER_LOGGEDIN, false];
    if !(_isLoggedIn) exitWith { DEBUG("skipping recon routine - not logged in"); };
    private _characterID = player getVariable [COOPR_CHAR_CHARACTER_ID, -1];

    private _isInRecon = player getVariable [COOPR_CHAR_IN_RECON, false];
    private _isInMissionArea = [player] call coopr_fnc_isInMissionArea;

    if (_isInRecon and _isInMissionArea) then {
        DEBUG2("running recon routine for character %1", _characterID);
        private _reconMissionId = player getVariable [COOPR_CHAR_ACTIVE_MISSION, []];
        private _reconMissionMarker = _reconMissionId + "_mission_marker";
        private _areaStrengths = [_reconMissionMarker] call coopr_fnc_parseStrengthsInArea;
        private _reportID = [_characterID] call coopr_fnc_getReportIdForCharacterLocal;
        [_reportID, _areaStrengths] call coopr_fnc_setReconAreaActivity;
        COOPR_RECON_ROUTINE_TOGGLE = false; // turn off recon routine
    };
}
