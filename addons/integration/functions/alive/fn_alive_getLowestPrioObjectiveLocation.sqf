#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the location of the lowest objective found in the ALiVE OPCOM system
 *
 * Arguments:
 * 0: _player <OBJECT> - (Optional) The unit from which the spotreps should be retrieved
 *
 * Return Value:
 * _location <LOCATION> - of found lowest objective
 *
 * Example:
 * call coopr_fnc_alive_getLowestPrioObjectiveLocation;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_side", sideEmpty, ["", west]]];

if (_side isEqualTo sideEmpty) exitWith { ERROR("_side was empty") };

private _lowestPrioObjective = [_side, "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;

// check for another objective type
if (_lowestPrioObjective isEqualTo objNull) then {
    _lowestPrioObjective = [_side, "attack"] call coopr_fnc_alive_getLowestPriorityObjective;
};

if (not (_lowestPrioObjective isEqualTo objNull)) then {
   [_lowestPrioObjective, "center"] call alive_fnc_hashGet;
} else {
   [];
}
