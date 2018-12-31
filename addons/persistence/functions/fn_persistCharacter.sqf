#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists a given character/player object to the specified persistent location (local/official/custom)
 *
 * Arguments:
 * 0: _character <OBJECT> - the object of the actual player/character
 *
 * Return Value:
 * None
 *
 * Example:
 * player call coopr_fnc_persistCharacter
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_playerUID", ""],
       ["_character", objNull]];

if(_character isEqualTo objNull) exitWith { ERROR("_dbName was objNull") };
if(_playerUID isEqualTo "") exitWith { ERROR("_playerUID was empty string") };

if(isServer)then {
    if(_playerUID call coopr_fnc_hasUser) then {
        private _characterHash = ["coopr", _character] call coopr_fnc_prefixVaraiblesToHash;

        private _protocolName = "coopr";
        //TODO: unfinished business
        private _createUsersTable = "INSERT INTO ";

        private _result = call compile ("extDB3" callExtension format["0:%1:%2", _protocolName, _createUsersTable]);

        private _returnCode = _result select 0;
        DEBUG2("return code is: %1", _returnCode);
        private _payload = _result select 1;
        DEBUG2("payload is: %1", _payload);

        if(_payload isEqualTo []) then {
            INFO2("extDB3: No user could be found for steamID %1", _steamID);
            false;
        } else {
            INFO2("extDB3: user found for steamID %1", _steamID);
            true;
        };
    } else {
        INFO2("skipping character perstisting. No user for id %1 in database", _playerUID);
    };
}
