#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will help the counting of reported units for the report validation function
 *
 * Arguments:
 * 0: _entities <ARRAY> - The entities array (returned by 'nearEntities')
 * 1: _sideFilter <SIDE> - The side that should be filtered for (Optional)
 *
 * Return Value:
 * _count - <NUMBER>
 *
 * Example:
 * [(getPos player) nearEntities ["Man", 100], "East"] call coopr_fnc_countUnits;
 * [(getPos player) nearEntities ["Man", 100]] call coopr_fnc_countUnits;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_entities", []],
        ["_sideFilter", sideEmpty]];

private _counter = 0;
if (_entities isEqualTo []) exitWith { _counter };
DEBUG2("side filter is %1", _sideFilter);

{
    private _group = _x;
    private _unitCount = count (units _group);
    private _sideOfGroup = side _group;

    if (_sideFilter isEqualTo sideEmpty) then {
        _counter = _counter + _unitCount;
    } else {
        if (_sideOfGroup isEqualTo _sideFilter) then {
            _counter = _counter + _unitCount;
        };
    };

} forEach _entities;

DEBUG2("counted %1 units", _counter);
_counter;

