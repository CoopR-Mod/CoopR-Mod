#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * create a squad
 *
 * Arguments:
 * 0: _ownerId <Number> - character id
 * 1: _squadName <String>
 * 2: _squadCallsign <String>
 *
 * Example:
 * [123, "mySquad", "MYSQ"] call coopr_fnc_createSquad
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_ownerId", -1],
        ["_squadName", ""],
        ["_squadCallsign", ""]];

if (_ownerId <= 0) exitWith { ERROR("_ownerId was invalid") };
if (_squadName isEqualTo "") exitWith { ERROR("_squadName was invalid") };
if (_squadCallsign isEqualTo "") exitWith { ERROR("_squadCallsign was invalid") };

if (isServer) then {
    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        [_ownerId, _squadName, _squadCallsign] call coopr_fnc_createSquadLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

