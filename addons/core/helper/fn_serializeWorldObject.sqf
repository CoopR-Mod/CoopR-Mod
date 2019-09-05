#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * serializes an object from the world to a hash object
 *
 * Arguments:
 * 0: _obj <OBJECT>       - name of the object
 * 1: _deleteObj <BOOL>   - flag to remove the object after serialization (optional)
 * 2: _initCode <ARRAY>   - Code to be executed on object initialization (once deseralized)
 * 		0: _code <STRING> - Code as string
 *		1: _target        - target for execution (GLOBAL, server, players, one player)
 *
 * Return Value:
 * _serializedObj - <ARRAY>
 *
 * Example:
 * [_newTent, false, ["addAction ["hi", {hint hi}]"], GLOBAL] call coopr_fnc_serializeWorldObject
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_obj", ""],
        ["_deleteObj", false],
		["_initCode", []]];

if (_obj isEqualTo objNull) exitWith { ERROR("_obj is null") };
private _serializedObj = [];

{
  _serializedObj pushBack (_obj call _x);
} forEach [
    { _this }, // simply storing the name
	{typeOf _this},
	{getPosATL _this},
	{getDir _this},
	{["coopr_", obj] call coopr_fnc_getVariables},
	_initCode];

DEBUG("Object serialized");
if (_deleteObj) then { deleteVehicle _obj };

_serializedObj;
