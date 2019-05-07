#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR Recon Task
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestCooprTask;
 *
 * Public: No
 *
 * Scope: Client
 */

if (INTEGRATE_ALIVE) then {
    private _objectiveId = nil;
    private _lowestPrioObjective = ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;

    // check for another objective type
    if (_lowestPrioObjective isEqualTo objNull) then {
        _lowestPrioObjective = ["WEST", "attack"] call coopr_fnc_alive_getLowestPriorityObjective;
    };

    if (not (_lowestPrioObjective isEqualTo objNull)) then {
        _objectiveId = [_lowestPrioObjective, "objectiveID"] call alive_fnc_hashGet;
    };

    DEBUG2("recon objective: %1", _lowestPrioObjective);
    DEBUG2("current objective cache: %1", COOPR_RECON_OBJECTIVE_CACHE);
    while { _objectiveId in COOPR_RECON_OBJECTIVE_CACHE } do {
        _lowestPrioObjective = ["WEST", "attacking", COOPR_RECON_OBJECTIVE_CACHE] call coopr_fnc_alive_getLowestPriorityObjective;

        // check for another objective type
        if (_lowestPrioObjective isEqualTo objNull) then {
            _lowestPrioObjective = ["WEST", "attack", COOPR_RECON_OBJECTIVE_CACHE] call coopr_fnc_alive_getLowestPriorityObjective;
        };

        if (not (_lowestPrioObjective isEqualTo objNull)) then {
            _objectiveId = [_lowestPrioObjective, "objectiveID"] call alive_fnc_hashGet;
        };
    };

    private _position = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
    [player, _position] remoteExec ["coopr_fnc_createReconTask", EXEC_SERVER];

    if (count COOPR_RECON_OBJECTIVE_CACHE > 10) then {
        DEBUG("clearing recon location cache");
        COOPR_RECON_OBJECTIVE_CACHE = [];
    };

    COOPR_RECON_OBJECTIVE_CACHE pushBackUnique _objectiveId;
} else {
    ERROR("CoopR recon tasks can only be used in combination with ALiVE at the moment");
    // TODO call recon task for coopr or other integration
};
