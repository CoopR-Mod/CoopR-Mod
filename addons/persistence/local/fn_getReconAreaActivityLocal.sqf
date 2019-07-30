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

    DEBUG2("get recon area activity for report %1", _reportID);
    private _getActivity = format ["SELECT activity FROM recon_reports WHERE id = %1 AND finished = 0", _reportID];
    private _result = (_getActivity call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR;
};
