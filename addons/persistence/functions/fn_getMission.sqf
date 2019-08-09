#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Get mission by id from local DB
 *
 * Arguments:
 * 0: _missionId <STRING> - the id of the mission
 *
 * Return Value:
 * characters <ARRAY> - the ID of the characters table for the given user
 *
 * Example:
 * ["coopr_mission_recon_0"] call coopr_fnc_getMission
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_missionId", ""]];


if (isServer) then {

    if (_missionId isEqualTo "") exitWith { ERROR("_missionId was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_missionId] call coopr_fnc_getMissionLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

