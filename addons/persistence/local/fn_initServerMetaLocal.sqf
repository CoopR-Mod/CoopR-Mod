#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized the table entry for this coopr server
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

if (isServer) then {

    private _insertServerMeta = format ["INSERT INTO server_meta VALUES (%1)", COOPR_SERVER_ID];
    _insertServerMeta call coopr_fnc_extDB3sql;

} else {
    SERVER_ONLY_ERROR;
};
