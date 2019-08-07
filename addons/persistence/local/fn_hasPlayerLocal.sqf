#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Checks if the current user (steam_id) is already in the local (extDB3) database
 *
 * Arguments:
 * 0: steamID <STRING> - the steam id of the connected user
 *
 * Return Value:
 * isAvailable <BOOLEAN>
 *
 * Example:
 * (getPlayerUID player) call coopr_fnc_hasPlayerLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_steamID", ""]];

//TODO: refactor to macro
if(_steamID isEqualTo "") exitWith { ERROR("_steamID was empty string") };

if (isServer) then {
    private _selectUserByID = format["SELECT * FROM users WHERE steam_id = '%1'", _steamID];
    private _payload = _selectUserByID call coopr_fnc_extDB3sql;

    if(_payload isEqualTo []) then {
        false;
    } else {
        true;
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
