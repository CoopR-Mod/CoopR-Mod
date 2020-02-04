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
 * [123, "mySquad", "MYSQ"] call coopr_fnc_createSquadLocal
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
    DEBUG2("create squad for character %1 from local persistence", _ownerId);
    private _createSquad = format["INSERT INTO squads (owner_id, squad_name, squad_callsign) VALUES(%1, '%2', '%3')", _ownerId, _squadName, _squadCallsign];

    _createSquad call coopr_fnc_extDB3sql;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};


