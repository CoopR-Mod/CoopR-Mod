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
    INFO("determining infantry units in recon area");
    private _infantryStrengths = [_marker, "Man"] call coopr_fnc_determineUnitStrength;
    INFO("determining motorized units in recon area");
    private _motorizedStrengths = [_marker, "Car"] call coopr_fnc_determineUnitStrength;
    INFO("determining armored units in recon area");
    private _armoredStrengths = [_marker, "Tank"] call coopr_fnc_determineUnitStrength;

} else {
    SERVER_ONLY_ERROR;
};



