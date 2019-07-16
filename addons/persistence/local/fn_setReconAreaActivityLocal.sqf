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

params [["_reportID", -1],
        ["_activity", []]];

if (isServer) then {
  if (_reportID isEqualTo -1) exitWith { ERROR("_reportID was not defined") };
  if (_activity isEqualTo []) exitWith { ERROR("_activity was not defined") };

    INFO2("set recon activity for report %1", _reportID);
    private _setActivity = format ["UPDATE recon_reports SET activity = '%1' WHERE id = %2 AND finished = 0", _activity, _reportID];
    _setActivity call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR;
};
