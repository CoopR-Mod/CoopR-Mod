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
private _uniqueUnits = [];
if (_entities isEqualTo []) exitWith { _counter };
DEBUG2("side filter is %1", _sideFilter);
DEBUG2("enitities  %1", _entities);

{
    private _entity = _x;
    private _sideOfGroup = side _entity;

    {
        if (_sideFilter isEqualTo sideEmpty) then {
            _uniqueUnits pushBackUnique _x;
        };
        if (_sideFilter isEqualTo _sideOfGroup) then {
            _uniqueUnits pushBackUnique _x;
        };
    } forEach (units _entity);


} forEach _entities;


DEBUG2("counted %1 units", count _uniqueUnits);
count _uniqueUnits;

