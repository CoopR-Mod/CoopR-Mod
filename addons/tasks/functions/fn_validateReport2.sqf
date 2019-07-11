#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon reports. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _marker <MARKER> - The description text of a marker to filter it among allMarkers
 *
 * Return Value:
 * _accuracy <NUMBER> - Percentage of how accurate the report was
 *
 * Example:
 * [325342, "Fireteam", "Infantry", "Patrol"] call coopr_fnc_validateReport;
 *
 * Public: No
 *
 * Scope: Server
 */

#define X 0

params [["_marker", ""],
        ["_strengthReports", []]];

if (isServer) then {

    if (_marker isEqualTo "") exitWith { ERROR("_marker was not defined") };
    if (_strengthReports isEqualTo []) exitWith { ERROR("_strengthReports was not defined") };

    INFO("recon validation check:");

    INFO("counting units in recon area");
    private _markerPos = getMarkerPos _marker;
    private _markerRadius = getMarkerSize _marker select X;

    // INFANTRY
    private _infantryEntities = _markerPos nearEntities ["Man", _markerRadius];
    private _infGroups = [_infantryEntities] call coopr_fnc_groupsByEntities;
    private _infantryStrengths = [];

    DEBUG2("inf groups: %1", _infGroups);
    {
        private _grp = _x;
        DEBUG2("counting group: %1", _grp);
        private _infantryCount = [_grp] call coopr_fnc_countUnits;
        DEBUG2("found infantry units: %1", _infantryCount);
        _infantryStrengths pushBack ([_infantryCount] call coopr_fnc_getStrengthByUnitCount);
    } forEach _infGroups;

    DEBUG2("all infantry actual strengths: %1", _infantryStrengths);

    // MOTORIZED
    private _motorizedEntities = _markerPos nearEntities ["Car", _markerRadius];
    private _motGroups = [_motorizedEntities] call coopr_fnc_groupsByEntities;
    private _motorizedStrengths = [];

    DEBUG2("motorized groups: %1", _motGroups);
    {
        private _grp = _x;
        DEBUG2("counting group: %1", _grp);
        private _motorizedCount = [_grp] call coopr_fnc_countUnits;
        DEBUG2("found motorized units: %1", _motorizedCount);
        _motorizedStrengths pushBack ([_motorizedCount] call coopr_fnc_getStrengthByUnitCount);
    } forEach _motGroups;

    DEBUG2("motorized actual strength: %1", _motorizedStrengths);

    // ARMORED
    private _armoredCount = count (_markerPos nearEntities ["Tank", _markerRadius]);
    DEBUG2("found armored units: %1", _armoredCount);
    private _armoredStrength = [_armoredCount] call coopr_fnc_getStrengthByUnitCount;
    DEBUG2("armored actual strength: %1", _armoredStrength);

} else {
    SERVER_ONLY_ERROR;
};



