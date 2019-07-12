#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This is the validation logic for the recon reports. This will decide if a recon report will be generated into a task
 * or not.
 *
 * Arguments:
 * 0: _strengthReports <ARRAY> - all report entries to validate against
 *
 * Return Value:
 * _accuracy <NUMBER> - Percentage of how accurate the report was
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_strengthReports", []]];

if (isServer) then {

    if (_marker isEqualTo "") exitWith { ERROR("_marker was not defined") };
    if (_strengthReports isEqualTo []) exitWith { ERROR("_strengthReports was not defined") };


} else {
    SERVER_ONLY_ERROR;
};



