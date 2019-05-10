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

    INFO("saving recon entry");
    private _characterId = [_entryHash, COOPR_KEY_RECON_ENTRY_OWNER] call CBA_fnc_hashGet;
    private _updateTask = format["INSERT INTO recon_entries (report_id, entry) VALUES(%1, '%2')", _taskId, _serializedTask];
    _updateTask call coopr_fnc_extDB3sql;

} else {
    SERVER_ONLY_ERROR;
};
