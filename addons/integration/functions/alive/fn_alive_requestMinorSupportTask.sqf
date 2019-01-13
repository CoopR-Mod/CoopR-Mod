#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Integrates with ALiVE and looks for small attack tasks for small squads.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_requestMinorSupportTask;
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
    private _targets = [_positionOfObjective, _objectiveSize, [_enemySide,"entity"], true] call ALIVE_fnc_getNearProfiles;
    private _taskStatus = false;

    if (count _targets isEqualTo 0) then {
        private _nearestLocation = [_positionOfObjective] call coopr_fnc_getNearestLocation;
        DEBUG2("nearest town for recon task is: %1", _nearestLocation);
        DEBUG2("position of obj is: %1", _positionOfObjective);
        _taskStatus = [player, getPos _nearestLocation] call coopr_fnc_createReconTask;
        systemChat "||CoopR|| No enemies have been spotted in the attack area. Start a recon to the nearest town";
    } else {
        _taskStatus = ["WEST","BWA3_Faction_Fleck","DestroyInfantry", _targets, getPlayerUID player, false] call ALiVE_fnc_taskRequest;
        systemChat "||CoopR|| Hostile units have been spotted in the area. Eliminate them!";
    };


    if (_taskStatus isEqualTo false) then {
        systemChat "||CoopR|| There are no tasks for your unit at the moment";
    };

} else {
    systemChat "||CoopR|| No objectives available at the moment";
};

