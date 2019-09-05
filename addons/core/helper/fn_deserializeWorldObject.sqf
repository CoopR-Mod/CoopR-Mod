#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * deserializes an object and materializes it in the world (wow). New object maintains all coopr_ variables when serialized
 *
 * Arguments:
 * 0: _serializedObject <ARRAY> - serialized state of an object
 *
 * Return Value:
 * _deserializedObject - <OBJECT>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params ["_serializedObject"];

if (_serializedObject isEqualTo []) exitWith { ERROR("_serializedObject was not defined") };


INFO2("deserializing object %1", _serializedObject select 0);

private _object    = _serializedObject select 0;
private _className = _serializedObject select 1;
private _pos       = _serializedObject select 2;
private _dir       = _serializedObject select 3;
private _cooprVars = _serializedObject select 4;
private _init      = _serializedObject select 5;
private _code      = _init select 0;
private _target    = _init select 1;

private _deserializedObject = createVehicle [_className, _pos];
_deserializedObject setPosATL _pos;
_deserializedObject setDir _dir;

private _setCooprVariables = {
    _deserializedObject setVariable [_key, _value]
};
[_cooprVars, _setCooprVariables] call CBA_fnc_hashEachPair;

if !(_init isEqualTo []) then {
    private _compiledCode = compile _code;
    //TODO cry
};

DEBUG("Object deserialized");
_deserializedObject;
