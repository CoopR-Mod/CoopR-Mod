#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the hostile activity in strength of the recon area
 *
 * Arguments:
 * 0: _reportID <NUMBER> - ID of the character the reports belongs to
 *
 * Return Value:
 * _strengths <CBA_HASH> - all hostile strengths in the recon area
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_reportID", -1]];

if (isServer) then {
  if (_reportID isEqualTo -1) exitWith { ERROR("_reportID was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        [_reportID] call coopr_fnc_getReconAreaActivityLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
