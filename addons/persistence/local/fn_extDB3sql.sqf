#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Simple wrapping function to make extDB3 SQL statements more easy to use
 *
 * Arguments:
 * 0: _statement <STRING> - the sql statement
 *
 * Return Value:
 * _payload <ARRAY> - the returned payload of the extDB3 database connection
 *
 * Example:
 * "INSERT INTO characters (character_1, character_2, character_3) VALUES ('[]', '[]', '[]')" call coopr_fnc_extDB3sql
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_statement", ""]];

if(_statement isEqualTo "") exitWith { ERROR("_statement was empty string") };

if (isServer) then {

    private _protocolName = "coopr";
    private _result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _statement]);

    private _returnCode = _result select 0;
    private _payload = _result select 1;

    if(_returnCode isEqualTo 0) exitWith {
        DEBUG("there was an error with the extDB3 sql statement call");
        DEBUG2("statement used: %1", _statement);
    };

    _payload;
} else {
    SERVER_ONLY_ERROR;
};
