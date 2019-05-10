#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized a recon report for a given character
 *
 * Arguments:
 * None
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

params [["_characterId", -1]];

if (isServer) then {
    if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };

    INFO2("init recon report for character %1", _characterId);
    private _hasReportStmt = format ["SELECT count(*) FROM recon_reports WHERE character_id = %1", _characterId];
    private _hasReport = (_hasReportStmt call coopr_fnc_extDB3sql) select 0 select 0;
    if (_hasReport > 0) then {
        DEBUG2("recon report for character %1 already initialized", _characterId);
    } else {
        private _initReconReport = format ["INSERT INTO recon_reports (character_id) VALUES (%1)", _characterId];
        _initReconReport call coopr_fnc_extDB3sql;
    };
} else {
    SERVER_ONLY_ERROR;
};
