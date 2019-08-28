#include "script_component.hpp"
/*
 * Author: Gilles
 *
 * find all variables in given namespace that match certain tag/name
 *
 * Arguments:
 * 0: _variableName <string> - tag/name to search
 * 1: _namespace <namespace> - nameSpace to search from, if it nos defined it takes missionNamespace as default
 *
 * Return Value:
 * _variablesFound - <ARRAY> NOTE: it is an array of strings!
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Global
 */

 params[["_variableName", objNull], ["_namespace", missionNamespace]];

 if !(typeName _variableName isEqualTo "STRING") exitWith{
	ERROR("_variableName was not defined OR didn't provide as string")};

private _variablesFound =  allVariables _namespace select {_x find _variableName == 0};

_variablesFound;