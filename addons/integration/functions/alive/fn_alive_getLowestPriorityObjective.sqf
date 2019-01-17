#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Looks for the lowest objective of a side and the the type
 *
 * Arguments:
 * 0: _side <STRING> - side of OPCOM / objectives
 * 1: _type <STRING> - type of objective
 *
 * Return Value:
 * Lowest Priority Objective - <OBJECT>
 *
 * Example:
 * ["WEST", "attacking"] call coopr_fnc_alive_getLowestPriorityObjective;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_side", ""], ["_type", ""]];

if (_side isEqualTo "") exitWith { ERROR("_side was empty string") };
if (_type isEqualTo "") exitWith { ERROR("_type empty string") };

private _opcom = nil;

{
    private _instance = _x;

    if (([_instance, "side", ""] call ALiVE_fnc_hashGet) isEqualTo _side) exitWith {
        _opcom = _instance;
    };

} forEach OPCOM_instances;

if (isNil "_opcom") exitWith { ERROR("OPCOM has no instances for given side") };

private _objectives = [_opcom, "objectives", []] call alive_fnc_hashGet;

if (_objectives isEqualTo []) exitWith { ERROR("OPCOM has no objectives") };

private _lowestPrioObjective = objNull;
private _lowestPrio = 999;

{
    private _currentPrio = [_x ,"priority", "none"] call alive_fnc_hashGet;
    if (_currentPrio < _lowestPrio) then {
        _lowestPrio = _currentPrio;
        private _state = [_x ,"opcom_state", "none"] call alive_fnc_hashGet;
        if (_state isEqualTo _type) then {
            _lowestPrioObjective = _x;
        }
    };
} forEach _objectives;

_lowestPrioObjective;
