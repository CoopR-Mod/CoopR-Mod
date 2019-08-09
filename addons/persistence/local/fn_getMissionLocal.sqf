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
 * mission <ARRAY> - the mission of the id
 *
 * Example:
 * ["coopr_mission_recon_0"] call coopr_fnc_getMissionLocal
 *
 * Public: No
 *
 * Scope: Server
 */

params[["_missionId", ""]];

if (_missionId isEqualTo "") exitWith { ERROR("_missionId was not defined") };

if (isServer) then {
    DEBUG2("get mission id %1 from local persistence", _missionId);
    private _getMissionId = format ["SELECT missionHash FROM missions WHERE mission_id = '%1'", _missionId];
    private _result = (_getMissionId call coopr_fnc_extDB3sql) select 0 select 0;
    _result;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

