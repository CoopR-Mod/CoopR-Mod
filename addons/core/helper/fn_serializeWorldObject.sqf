#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * serializes an object from the world to a hash object
 *
 * Arguments:
 * 0: _obj <OBJECT> - name of the marker
 * 1: _deleteObj <BOOL> - flag to remove the object after serialization (optional)
 *
 * Return Value:
 * _serializedObj - <ARRAY>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_obj", ""],
        ["_deleteObj", false]];

if (_obj isEqualTo objNull) exitWith { ERROR("_obj is null") };
private _serializedObj = [];

{
  _serializedObj pushBack (_obj call _x);
} forEach [
    { _this }, // simply storing the name
	{typeOf _this},
	{getPosATL _this},
	{getDir _this},
	{["coopr_", obj] call coopr_fnc_getVariables}];

DEBUG("Object serialized");
if (_deleteObj) then { deleteVehicle _obj };

_serializedObj;
