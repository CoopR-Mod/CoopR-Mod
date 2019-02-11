#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon reports. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _location <LOCATION> - The reported location of the report. This is used to have a radial area to check if the report is valid
 * 1: _strength <STRING> - The reported strength of the spotted enemy ("Fireteam", "Squad", etc.)
 * 2: _type <STRING> - The reported kind of enemy ("Infantry", "Motorized", etc.)
 * 3: _behaviour <STRING> - The reported behaviour of the enemy unit ("Attacking", "Patroling")
 *
 * Return Value:
 * None
 *
 * Example:
 * [325342, "Fireteam", "Infantry", "PATROL"] call coopr_fnc_validateReport;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_location", locationNull],
        ["_strength", ""],
        ["_type", ""],
        ["_behaviour", ""]];

if (_location isEqualTo locationNull) exitWith { ERROR("_location was locationNull") };
if (_strength isEqualTo "") exitWith { ERROR("_strength was empty string") };
if (_type isEqualTo "") exitWith { ERROR("_type was empty string") };
if (_behaviour isEqualTo "") exitWith { ERROR("_behaviour was empty string") };

if (isServer) then {
    private _positionOfReport = (_location call BIS_fnc_gridToPos) select 0; // [x,y] format
    private _accuracy = 100; // initial
    private _checkRadius = 0;
    // will turn "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
    private _type = [_type splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;

    // TODO: validate if was within range of recon objective
    // validate behaviour
    switch (_behaviour) do {
        case "ATTACKING": { _checkRadius = 0 }; // attacking enemies most likely will not be in the area afterwards
        case "DEFENDING": { _checkRadius = 100 }; // defending units might be a bit wider spreaded
        case "RESUPPLY": { _checkRadius = 0 };
        case "WITHDRAWING": { _checkRadius = 0 };
        case "STATIC": { _checkRadius = 25 }; // if a unit is reported as static it might be clear they won't leave their position
        case "PATROL": { _checkRadius = 250 }; // patroling units most likely will patrol a large perimeter
        case "DESTROYED": { _checkRadius = 0 }; // yea well...
        default { _checkRadius = 0 };
    };

    DEBUG2("check radius is %1", _checkRadius);
    if (_checkRadius isEqualTo 0) then {
        // the check radius is not relevant since the enemy probably won't be where it has been seen last (for instance a
        // moving support vehicle on the road)
        DEBUG("no existence check will happen");
    } else {
        private _foundVehicles = [_positionOfReport nearEntities ["Car", _checkRadius], east] call coopr_fnc_countUnits;
        private _foundInfantry = [_positionOfReport nearEntities ["Man", _checkRadius], east] call coopr_fnc_countUnits;
        private _foundTanks = [_positionOfReport nearEntities ["Tank", _checkRadius], east] call coopr_fnc_countUnits;

        DEBUG2("found %1 vehicles", _foundVehicles);
        DEBUG2("found %1 infantry", _foundInfantry);
        DEBUG2("found %1 tanks", _foundTanks);

        switch (_type) do {
            case "Infantry": {
                if (_foundInfantry isEqualTo 0) exitWith {
                    DEBUG("no infantry units are within the check area - accuracy is 0%");
                    _accuracy = 0;
                };
                DEBUG("inf units found");
            };
            case "MotorizedInfantry": {
                if ((_foundInfantry + _foundVehicles) isEqualTo 0) exitWith {
                    DEBUG("no infantry or vehicle units are within the check area - accuracy is 0%");
                    _accuracy = 0;
                };
                DEBUG("moto inf units found");
            };
            case "MechanizedInfantry": {
                if ((_foundInfantry + _foundTanks) isEqualTo 0) exitWith {
                    DEBUG("no infantry or armored units are within the check area - accuracy is 0%");
                    _accuracy = 0;
                };
                DEBUG("mech inf units found");
            };
            case "Armor": {
                if (_foundTanks isEqualTo 0) exitWith {
                    DEBUG("no armored units are within the check area - accuracy is 0%");
                    _accuracy = 0;
                };
                DEBUG("armored units found");
            };
        };

        // validate strength
        // validate type
    };
};



