#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all entries for a given report ID
 *
 * Arguments:
 * _reportID <NUMBER> - ID of report
 *
 * Return Value:
 * _entires <ARRAY> - all found entries
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_reportID", -1]];

if (isServer) then {
    if (_reportID isEqualTo -1) exitWith { ERROR("_reportID was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        call coopr_fnc_getEntriesForReportLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
