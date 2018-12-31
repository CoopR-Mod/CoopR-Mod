#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Checks if the current user (steam_id) is already in the database
 *
 * Arguments:
 * 0: steamID <STRING> - the steam id of the connected user
 *
 * Return Value:
 * isAvailable <BOOLEAN>
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_hasUser
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

//TODO: refactor to macro
if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

private _selectUserByID = format["SELECT * FROM users WHERE steam_id = '%1'", _steamID];
private _protocolName = "coopr";

_result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _selectUserByID]);

private _returnCode = _result select 0;
DEBUG2("return code is: %1", _returnCode);
private _payload = _result select 1;
DEBUG2("payload is: %1", _payload);

if(_payload isEqualTo []) then {
    INFO("extDB3: No user could be found for steamID %1", _steamID);
    false;
} else {
    INFO("extDB3: user found for steamID %1", _steamID);
    true;
};
