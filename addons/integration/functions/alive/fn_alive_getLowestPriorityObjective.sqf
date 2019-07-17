#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Looks for the lowest objective of a side and the the type
 *
 * Arguments:
 * 0: _side <STRING> - side of OPCOM / objectives
 * 1: _types <ARRAY> - array of objective type filter
 * 2: _cache <ARRAY> - objectives already assigned before
 *
 * Return Value:
 * Lowest Priority Objective - <OBJECT>
 *
 * Example:
 * ["WEST", ["attacking", "attack"]] call coopr_fnc_alive_getLowestPriorityObjective;
 * ["WEST", ["attacking", "attack"], COOPR_RECON_OBJECTIVE_CACHE] call coopr_fnc_alive_getLowestPriorityObjective;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_side", ""], ["_type", []], ["_cachedObjectives", []]];

if (_side isEqualTo "") exitWith { ERROR("_side was empty string") };
if (_type isEqualTo []) exitWith { ERROR("_type empty string") };
DEBUG("parsing ALiVE OPCOM objectives for lowest prio");

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
DEBUG2("OPCOM objectives found: %1 ", count _objectives);

private _typedObjectives = [];
{
  private _state = [_x ,"opcom_state", "none"] call alive_fnc_hashGet;
  if (_state in _type) then { _typedObjectives pushBackUnique _x; }
} forEach _objectives;

private _uncachedObjectives = [];
private _cacheIds = [];
{ _cacheIds pushBackUnique ([_x, "objectiveID"] call alive_fnc_hashGet) } forEach _cachedObjectives;

{
    private _id = [_x ,"objectiveID"] call alive_fnc_hashGet;
    if (_id in _cacheIds) then { INFO2("skipping objective (in cache) %1", _id);
    } else { _uncachedObjectives pushBackUnique _x; };
} forEach _typedObjectives;

DEBUG3("filtered objectives %1 for type %2", count _typedObjectives, _type);
private _lowestPrioObjective = nil;
private _lowestPrio = 999;

{
    private _currentPrio = [_x ,"priority", "none"] call alive_fnc_hashGet;
    DEBUG3("objective %1 prio: %2", _forEachIndex, _currentPrio);
    DEBUG2("lowest prio: %1", _lowestPrio);
    if (_currentPrio <= _lowestPrio) then {
        _lowestPrio = _currentPrio;
        _lowestPrioObjective = _x;
    };
} forEach _uncachedObjectives;


if ((isNil "_lowestPrioObjective") and (count COOPR_RECON_OBJECTIVE_CACHE > 0)) then {
    DEBUG("using cached value");
    _lowestPrioObjective = COOPR_RECON_OBJECTIVE_CACHE select 0;
    DEBUG("clearing cache");
    COOPR_RECON_OBJECTIVE_CACHE = [];
};

DEBUG2("lowest prio objective: %1", _lowestPrioObjective);
_lowestPrioObjective; // return
