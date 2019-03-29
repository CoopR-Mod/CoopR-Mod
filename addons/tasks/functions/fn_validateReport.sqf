#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon reports. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _checkAreaMarker <ARRAY> - The marker where the check should be made in
 * 1: _strength <STRING> - The reported strength of the spotted enemy ("Fireteam", "Squad", etc.)
 * 2: _type <STRING> - The reported kind of enemy ("Infantry", "Motorized", etc.)
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

params [["_checkAreaMarker", []],
        ["_strength", ""],
        ["_type", ""],
        ["_behaviour", ""]];

if (_checkAreaMarker isEqualTo []) exitWith { ERROR("_checkAreaMarker was locationNull") };
if (_strength isEqualTo "") exitWith { ERROR("_strength was empty string") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };
if (_behaviour isEqualTo "") exitWith { ERROR("_behaviour was empty string") };

private _foundVehicles = 0;
private _foundInfantry = 0;
private _foundTanks = 0;

DEBUG("checking report accuracy");
// TODO: use isInArray
if (_behaviour isEqualTo COOPR_TASK_BEHAVIOUR_PATROL) exitWith { ERROR("check for patrol not implemented yet")};
if (_behaviour isEqualTo COOPR_TASK_BEHAVIOUR_DEFENSIVE) then {
    private _markerPos = getMarkerPos (_checkAreaMarker select 0);
    private _markerRadius = (getMarkerSize (_checkAreaMarker select 0) select 0) / 2;

    _foundVehicles = [_markerPos nearEntities ["Car", _markerRadius], east] call coopr_fnc_countUnits;
    _foundInfantry = [_markerPos nearEntities ["Man", _markerRadius], east] call coopr_fnc_countUnits;
    _foundTanks = [_markerPos nearEntities ["Tank", _markerRadius], east] call coopr_fnc_countUnits;

    DEBUG2("found %1 vehicles", _foundVehicles);
    DEBUG2("found %1 infantry", _foundInfantry);
    DEBUG2("found %1 tanks", _foundTanks);
};

// will check if the reported strength (Fireteam, Platoon, etc.) and the found amount of units matches somehow
// there will be a simple calculation of how accurate the report is
DEBUG2("type: %1", _type);
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
