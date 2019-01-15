#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR Task. In combinatin with ALiVE it will launch a CoopR recon task at minor priority objectives.
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

private _lowestPrioObjective = ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;

// check for another objective type
if (isNil "_lowestPrioObjective") then {
    _lowestPrioObjective = ["WEST", "attack"] call coopr_fnc_alive_getLowestPriorityObjective;
};

if (not isNil "_lowestPrioObjective") then {
    private _positionOfObjective = [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
    private _objectiveSize = [_lowestPrioObjective, "size"] call alive_fnc_hashGet;
    private _enemySide = "EAST";
    private _taskStatus = false;

    _taskStatus = [player, _positionOfObjective] call coopr_fnc_createReconTask;
    systemChat "||CoopR|| HQ wants you to recon the objective area and observice enemy movements!";

    if (_taskStatus isEqualTo false) then {
        systemChat "||CoopR|| There are no tasks for your unit at the moment";
    };

} else {
    systemChat "||CoopR|| No objectives available at the moment";
};

