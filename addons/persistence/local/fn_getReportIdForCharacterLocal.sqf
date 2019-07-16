#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the report id for a given character
 *
 * Arguments:
 * _characterId <NUMBER> - ID of the character
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

    private _hasReportStmt = format ["SELECT count(*) FROM recon_reports WHERE character_id = %1 AND finished = 0", _characterId];
    private _hasReport = (_hasReportStmt call coopr_fnc_extDB3sql) select 0 select 0;
    if (_hasReport != 0) then {
        private _getId = format ["SELECT id FROM recon_reports WHERE character_id = %1 AND finished = 0", _characterId];
        private _reportID = (_getId call coopr_fnc_extDB3sql) select 0 select 0;
        INFO2("fetched report id: %1", _reportID);
        _reportID;
    } else {
        DEBUG2("no recon report found for character %1", _characterId);
        -1;
    };
} else {
    SERVER_ONLY_ERROR;
};
