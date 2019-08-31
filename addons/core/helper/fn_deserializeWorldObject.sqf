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

private _deserializedObject = createVehicle [_serializedObject select 1, _serializedObject select 2];
_deserializedObject setPosATL (_serializedObject select 2);
_deserializedObject setDir (_serializedObject select 3);
private _cbaHash = _serializedObject select 4;

private _setCooprVariables = {
    _deserializedObject setVariable [_key, _value]
};
[_cbaHash, _setCooprVariables] call CBA_fnc_hashEachPair;

DEBUG("Object deserialized");
_deserializedObject;
