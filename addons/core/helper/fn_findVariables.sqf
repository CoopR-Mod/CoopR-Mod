#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * find all variables in given namespace that match certain tag/name
 *
 * Arguments:
 * 0: _variableName <string> - tag/name to search
 * 1: _namespace <namespace> - nameSpace to search from, if it nos defined it takes missionNamespace as default
 * 3: _returnHASH <bool>     - Optional, defaults to true. Should the return be a CBA hash or an array with pairs?
 *
 * Return Value:
 * _variablesHash - <CBA HASH>
 * _variablesFound - <ARRAY>
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Local
 */

 params[["_variableName", objNull], ["_namespace", missionNamespace], ["_returnHASH", true]];

 if !(typeName _variableName isEqualTo "STRING") exitWith{
	ERROR("_variableName was not defined OR didn't provide as string")};

private _variablesFound = [];
private _keysFound =  allVariables _namespace select {_x find _variableName == 0};
private _valuesFound = _keysFound apply {_namespace getVariable _x};

_keysFound apply {
	private _pair = [_x, _valuesFound select (_keysFound find _x)];
	_variablesFound pushBackUnique _pair;
};

private _variablesHash = [_variablesFound, nil] call CBA_fnc_hashCreate;

if!(_returnHASH) exitWith {_variablesFound};

if!(_variablesHash call CBA_fnc_isHash) exitWith {
	ERROR("Could not create a CBA hash with given variables! Pairs in array returned instead");

	_variablesFound;
	};

_variablesHash;