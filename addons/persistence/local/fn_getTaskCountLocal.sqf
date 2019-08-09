#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Counts all missions created
 *
 * Arguments:
 * None
 *
 * Return Value:
 * _count <NUMBER> - Amount of missions created
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    private _countMissions = "SELECT count(*) FROM missions";
    private _result = (_countMissions call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

