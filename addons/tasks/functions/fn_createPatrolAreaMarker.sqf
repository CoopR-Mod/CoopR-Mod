#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Creates a marker between two points to define a patrol area
 *
 * Arguments:
 * 0: _patrolFlag <ARRAY> - unit this task is assigned to
 *
 * Return Value:
 * _patrolMarkers <ARRAY> - returns an array of all generated patrol markers
 *
 * Example:
 * [["marker_one","marker_two"]] call coopr_fn_createPatrolAreaMarker;
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_patrolFlags", []]];

if (_patrolFlags isEqualTo []) exitWith { ERROR("_patrolFlags was []") };

DEBUG("creating patrol area marker");
private _createdPatrolMarker = [];
private _flagPositions = [];
{ _flagPositions pushBackUnique (getMarkerPos _x); } forEach _patrolFlags; // map to positions
{
    private _firstIndex = _forEachIndex;
    private _posA = _x;
    private _posB;
    {
        if (_forEachIndex isEqualTo _firstIndex + 1) then {
            _posB = _x;
            private _dir = [_posA, _posB] call BIS_fnc_dirTo;
            private _distance = _posA distance _posB;
            DEBUG3("posA: %1 / posB: %2", _posA, _posB);
            private _centerPos = [((_posA select 0) + (_posB select 0))/2, ((_posA select 1) + (_posB select 1))/2];
            private _patrolMarker = createMarker ["coopr_patrol_marker_" + str serverTime + str _forEachIndex, _centerPos];
            _patrolMarker setMarkerSize [_distance/4, _distance/2];
            _patrolMarker setMarkerDir _dir;
            _patrolMarker setMarkerShape "RECTANGLE";
            _patrolMarker setMarkerColor "ColorBlue";
            if !(COOPR_DEV_MODE) then {
                _patrolMarker setMarkerAlpha 0; // make invisible if not in dev mode
            };
            _createdPatrolMarker pushBackUnique _patrolMarker;
            DEBUG("patrol area marker created");
        };
    } forEach _flagPositions;

} forEach _flagPositions;

DEBUG2("created %1 patrol area markers", count _createdPatrolMarker);
_createdPatrolMarker
