#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Updates the hostile activity in strength for the recon report (area)
 *
 * Arguments:
 * 0: _reportID <NUMBER> - ID of the character the reports belongs to
 * 1: _activity <CBA_HASH> - strength activity in the area
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_reportID", -1],
        ["_activity", []]];

if (isServer) then {
  if (_reportID isEqualTo -1) exitWith { ERROR("_reportID was not defined") };
  if (_activity isEqualTo []) exitWith { ERROR("_activity was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
       [_reportID, _activity] call coopr_fnc_setReconAreaActivityLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
