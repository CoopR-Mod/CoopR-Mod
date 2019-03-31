#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon reports. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _markerText <STRING> - The description text of a marker to filter it among allMarkers
 * 1: _strength <STRING> - The reported strength of the spotted enemy ("Fireteam", "Squad", etc.)
 * 2: _type <STRING> - The reported kind of enemy ("Infantry", "Motorized", etc.)
 * 3: _behaviour <STRING> - The reported behaviour of an enemy
 *
 * Return Value:
 * _accuracy <NUMBER> - Percentage of how accurate the report was
 *
 * Example:
 * [325342, "Fireteam", "Infantry", "Patrol"] call coopr_fnc_validateReport;
 *
 * Public: No
 *
 * Scope: Client
 */

params [["_markerText", ""],
        ["_strength", ""],
        ["_type", ""],
        ["_behaviour", ""]];

if (_markerText isEqualTo "") exitWith { ERROR("_markerText was not defined") };
if (_strength isEqualTo "") exitWith { ERROR("_strength was empty string") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };
if (_behaviour isEqualTo "") exitWith { ERROR("_behaviour was empty string") };

private _checkAreaMarker = [];
private _foundVehicles = 0;
private _foundInfantry = 0;
private _foundTanks = 0;

DEBUG("checking report accuracy");
// TODO: use isInArray

switch (_behaviour) do {
    case COOPR_TASK_BEHAVIOUR_COMBAT: { [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["This behaviour type is not yet implemented"]] call CBA_fnc_notify };
    case COOPR_TASK_BEHAVIOUR_PATROL: {
       _checkAreaMarker = [_markerText] call coopr_fnc_createPatrolAreaMarker;
       [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["This behaviour type is not yet implemented"]] call CBA_fnc_notify;
    };
    case COOPR_TASK_BEHAVIOUR_DEFENSIVE: {
        _checkAreaMarker pushBack ([_markerText] call coopr_fnc_createDefensiveAreaMarker);
        private _markerPos = getMarkerPos (_checkAreaMarker select 0);
        private _markerRadius = (getMarkerSize (_checkAreaMarker select 0) select 0) / 2;

        _foundVehicles = [_markerPos nearEntities ["Car", _markerRadius], east] call coopr_fnc_countUnits;
        _foundInfantry = [_markerPos nearEntities ["Man", _markerRadius], east] call coopr_fnc_countUnits;
        _foundTanks = [_markerPos nearEntities ["Tank", _markerRadius], east] call coopr_fnc_countUnits;

        DEBUG2("found %1 vehicles", _foundVehicles);
        DEBUG2("found %1 infantry", _foundInfantry);
        DEBUG2("found %1 tanks", _foundTanks);
    };
};

if (count _checkAreaMarker isEqualTo 0) exitWith { ERROR("no area check marker could be created") };
{ deleteMarker _x } forEach _checkAreaMarker; // remove helper marker since they are not needed anymore

// will check if the reported strength (Fireteam, Platoon, etc.) and the found amount of units matches somehow
// there will be a simple calculation of how accurate the report is
switch (_type) do {
    case COOPR_TASK_REPORT_TYPE_INFANTRY: {
        if (_foundInfantry isEqualTo 0) then {
            INFO("no infantry units are within the check area - accuracy is 0%");
            0;
        } else {
            [_foundInfantry, _strength] call coopr_fnc_strengthAccuracy;
        };
    };
    case COOPR_TASK_REPORT_TYPE_MOTORIZED: {
        if ((_foundInfantry + _foundVehicles) isEqualTo 0) then {
            INFO("no motorized units are within the check area - accuracy is 0%");
            0;
        } else {
            [_foundInfantry + _foundVehicles, _strength] call coopr_fnc_strengthAccuracy;
        };
    };
    case COOPR_TASK_REPORT_TYPE_MECHANIZED: {
        if ((_foundInfantry + _foundTanks) isEqualTo 0) then {
            INFO("no mechanized units are within the check area - accuracy is 0%");
            0;
        } else {
            [_foundInfantry + _foundTanks, _strength] call coopr_fnc_strengthAccuracy;
        };
    };
    case COOPR_TASK_REPORT_TYPE_ARMORED: {
        if (_foundTanks isEqualTo 0) then {
            INFO("no armored units are within the check area - accuracy is 0%");
            0;
        } else {
            [_foundTanks, _strength] call coopr_fnc_strengthAccuracy;
        };
    };
    default { ERROR("defaulting in validation"); 0;};
};
