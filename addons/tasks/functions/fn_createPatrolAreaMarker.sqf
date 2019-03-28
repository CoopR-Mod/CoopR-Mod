#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Creates a marker between two points to define a patrol area
 *
 * Arguments:
 * 0: _markerText <STRING> - description of the marker
 *
 * Return Value:
 * _patrolMarkers <ARRAY> - returns an array of all generated patrol markers
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_markerText", ""]];

if (_markerText isEqualTo "") exitWith { ERROR("_markerText was ''") };

DEBUG("creating patrol area marker");
// patrol marker
private _patrolFlags = allMapMarkers select { (markerType _x) isEqualTo "hd_flag" and ((markerText _x) isEqualTo _markerText)};
DEBUG2("patrol markers: %1", count _patrolFlags);

if ((count _patrolFlags) < 2) exitWith {
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["To mark a patrol you need at least two flag marker"]] call CBA_fnc_notify;
};

if ((count _patrolFlags) > 1) then {
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
                _patrolMarker setMarkerSize [_distance/3, _distance/1.5];
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
    _createdPatrolMarker; // return
};
