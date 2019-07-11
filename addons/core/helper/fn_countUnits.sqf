#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will help the counting of reported units for the report validation function
 *
 * Arguments:
 * 0: _group <GROUP> - The group
 *
 * Return Value:
 * _count - <NUMBER>
 *
 * Example:
 * trivial
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_group", []]];

private _counter = 0;
private _uniqueUnits = [];
if (_group isEqualTo []) exitWith { _counter };
DEBUG2("group  %1", _group);

{
    private _unit = _x;
    if ((vehicle _unit) isEqualTo _unit) then {
        _uniqueUnits pushBackUnique _unit;
    } else {
      DEBUG("unit is a crew member - skipping");
    }

} forEach units _group;

DEBUG2("counted %1 units", count _uniqueUnits);
count _uniqueUnits;

