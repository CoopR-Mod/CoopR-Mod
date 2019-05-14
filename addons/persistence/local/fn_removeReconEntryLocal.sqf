#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * removes an recon entry from the local database
 *
 * Arguments:
 * 0: _id <NUMBER> - entry id
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

params [["_id", -1]];

if (isServer) then {
    if (_id isEqualTo -1) exitWith { ERROR("_id was not defined") };
    private _removeEntry = format["DELETE FROM recon_entries WHERE id = %1", _id];
    _removeEntry call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR;
};
