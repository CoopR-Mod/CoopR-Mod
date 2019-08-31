#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR Recon Mission
 *
 * Arguments:
 * 0: _player <OBJECT> - player this mission is assigned to
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestCooprMission;
 *
 * Public: No
 *
 * Scope: Server
 */

#define CACHE_SIZE 3

params [["_player", objNull]];

if (_player isEqualTo objNull) exitWith { ERROR("_player was objNull") };

if (isServer) then {
    if (COOPR_ALIVE) then {
        DEBUG2("current objective cache: %1", COOPR_RECON_OBJECTIVE_CACHE);
        private _lowestPrioObjective = ["WEST", ["attacking", "attack"], COOPR_RECON_OBJECTIVE_CACHE] call coopr_fnc_alive_getLowestPriorityObjective;

        if (not (isNil "_lowestPrioObjective")) then {
            COOPR_RECON_OBJECTIVE_CACHE pushBackUnique _lowestPrioObjective;
            private _position = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
            [_player, _position] call coopr_fnc_createReconMission;
        } else {
            ERROR("no recon mission could be generated");
        };

    } else {
        ERROR("CoopR recon missions can only be used in combination with ALiVE at the moment");
        // TODO call recon mission for coopr or other integration
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
}
