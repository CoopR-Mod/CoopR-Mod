#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will (re)initialize all missions a character was assigned to
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

INFO("reinit missions to character");
private _activeMissionID = player getVariable [COOPR_CHAR_ACTIVE_MISSION, []];
if (_activeMissionID isEqualTo []) exitWith { INFO("no active missions - skipping reinit"); };

[[_activeMissionID], "coopr_fnc_getMission", [], {
    params ["_callbackArgs", "_promisedResult"];
    [_promisedResult, player] call coopr_fnc_deserializeMission;
}] call coopr_fnc_promise;

