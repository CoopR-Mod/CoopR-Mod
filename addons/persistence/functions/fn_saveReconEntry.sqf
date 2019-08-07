#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Persists an entry to the local database
 *
 * Arguments:
 * 0: _reconEntry <CBA-HASH> - recon entry to be saved
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_reconEntry", []]];

if (isServer) then {
    if (_reconEntry isEqualTo []) exitWith { ERROR("_reconEntry was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_reconEntry] call coopr_fnc_saveReconEntryLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
