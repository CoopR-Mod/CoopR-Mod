#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Fetch all members of a given squad (by id)
 *
 * Arguments:
 * 0: _squadId <NUMBER> - the squad id
 *
 * Return Value:
 * characters <ARRAY> - the members of a squad
 *
 * Example:
 * [123] call coopr_fnc_getSquadMembers
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_squadId", ""]];

if (_squadId <= 0) exitWith { ERROR("_squadId was invalid") };

if (isServer) then {
    DEBUG2("get squad id %1 from local persistence", _squadId);
    private _getSquadMembers = format ["SELECT squad FROM missions WHERE mission_id = '%1'", _missionId];
    private _result = (_getSquadMembers call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};


