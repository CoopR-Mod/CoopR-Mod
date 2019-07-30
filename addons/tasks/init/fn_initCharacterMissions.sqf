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
private _activeTaskID = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
if (_activeTaskID isEqualTo []) exitWith { INFO("no active missions - skipping reinit"); };

[[_activeTaskID], "coopr_fnc_getTask", [], {
    params ["_callbackArgs", "_promisedResult"];
    [_promisedResult, player] call coopr_fnc_deserializeTask;
}] call coopr_fnc_promise;

