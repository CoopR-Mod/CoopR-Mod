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
    private _reconTaskDestination = "WEST" call coopr_fnc_alive_getLowestPriorityObjectiveLocation;
    [player, _reconTaskDestination] remoteExec ["coopr_fnc_createReconTask", EXEC_SERVER];
} else {
    ERROR("CoopR recon tasks can only be used in combination with ALiVE at the moment");
    // TODO call recon task for coopr or other integration
};
