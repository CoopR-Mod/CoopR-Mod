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
    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        _squadId call coopr_fnc_getSquadMembersLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

