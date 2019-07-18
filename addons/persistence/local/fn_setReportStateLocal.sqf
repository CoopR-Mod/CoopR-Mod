#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Sets the recon report to a given state
 *
 * Arguments:
 * 0: _characterId <NUMBER> - ID of the character the reports belongs to
 * 1: _state <BOOLEAN> - the state to set
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

params [["_characterId", -1],
        ["_state", objNull]];

if (isServer) then {
    if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };
    if (_state isEqualTo objNull) exitWith { ERROR("_state was not defined") };

    DEBUG2("change recon report state for character %1", _characterId);
    private _hasReportStmt = format ["SELECT count(*) FROM recon_reports WHERE character_id = %1", _characterId];
    private _hasReport = (_hasReportStmt call coopr_fnc_extDB3sql) select 0 select 0;
    if (_hasReport == 0) exitWith {
        DEBUG2("no recon report found for character %1", _characterId);
    };
    private _updateState = format ["UPDATE recon_reports SET finished = %1 WHERE character_id = %2", _state, _characterId];
    _updateState call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR;
};
