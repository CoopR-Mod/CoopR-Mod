#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will parse all unique groups out of an array of entities
 *
 * Arguments:
 * 0: _entities <ARRAY> - entities to parse
 *
 * Return Value:
 * _uniqueGroups - <ARRAY>
 *
 * Example:
 * trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_entities", []],
        ["_side", sideEmpty]];

private _counter = 0;
private _uniqueGroups = [];
if (_entities isEqualTo []) exitWith { _uniqueGroups };
if (_side isEqualTo sideEmpty) exitWith { ERROR("_side was not defined") };

DEBUG2("entities  %1", _entities);

{
    private _entity = _x;
    private _grp = group _entity;
    if (side _grp isEqualTo _side) then {
        _uniqueGroups pushBackUnique (group _entity);
    };
} forEach _entities;

DEBUG2("parsed groups", _uniqueGroups);
_uniqueGroups;

