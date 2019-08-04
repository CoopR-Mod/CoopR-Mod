#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists an entry to the local database
 *
 * Arguments:
 * 0: _reconEntry <CBA-HASH> - recon entry to be saved
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

params [["_reconEntry", []]];

if (isServer) then {
    if (_reconEntry isEqualTo []) exitWith { ERROR("_reconEntry was not defined") };

    private _characterId = [_reconEntry, COOPR_KEY_RECON_ENTRY_OWNER] call CBA_fnc_hashGet;
    private _reportID = [_characterId] call coopr_fnc_getReportIdForCharacterLocal;
    private _countStmt = "SELECT count(*) FROM recon_entries";
    private _countEntries = (_countStmt call coopr_fnc_extDB3sql) select 0 select 0;
    [_reconEntry, COOPR_KEY_RECON_ENTRY_ID, _countEntries + 1] call CBA_fnc_hashSet;

    INFO("saving recon entry");
    private _saveEntry = format["INSERT INTO recon_entries (id, report_id, entry) VALUES(%1, %2, '%3')",_countEntries + 1, _reportID, _reconEntry];
    _saveEntry call coopr_fnc_extDB3sql;

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
