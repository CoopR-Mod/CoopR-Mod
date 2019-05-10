#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a serialized task to the local database
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

    [[_characterId], "coopr_fnc_getReportIdForCharacterLocal", [_reconEntry], {
        params ["_callbackArgs", "_promisedResult"];
        _callbackArgs params ["_reconEntry"];

        INFO("saving recon entry");
        private _saveEntry = format["INSERT INTO recon_entries (report_id, entry) VALUES(%1, '%2')", _promisedResult, _reconEntry];
        _saveEntry call coopr_fnc_extDB3sql;

    }] call coopr_fnc_promise;

} else {
    SERVER_ONLY_ERROR;
};
