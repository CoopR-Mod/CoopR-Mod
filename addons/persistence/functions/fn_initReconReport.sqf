#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Initialized a recon report for a given character
 *
 * Arguments:
 * 0: _characterId <NUMBER> - ID of the character
 * 1: _missionId <STRING> - ID of the recon mission referencing to this report
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

params [["_characterId", -1],
        ["_missionId", ""]];

if (isServer) then {
    if (_characterId isEqualTo -1) exitWith { ERROR("_characterId was not defined") };
    if (_missionId isEqualTo "") exitWith { ERROR("_missionId was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo PERS_LOCAL) then {
        [_characterId, _missionId] call coopr_fnc_initReconReportLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
