#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR recon mission that applied to the whole group of a given unit.
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this mission is assigned to
 * 1: _reconDestination <LOCATION> - unit this mission is assigned to
 *
 * Return Value:
 * Boolean - if mission was created successfully
 *
 * Example:
 * [_unit, _reconDestination] call coopr_fnc_createReconMission;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull],
        ["_reconDestination", locationNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_reconDestination isEqualTo locationNull) exitWith { ERROR("_reconDestination was locationNull") };

if (isServer) then {
    private _missionType = "coopr_mission_recon";
    private _missionId = format ["%1_%2", _missionType, (call coopr_fnc_getMissionCount) + 1];
    private _reconMission = [_unit, [_missionId], "CoopR_Mission_Recon", [], 1, 2, true] call BIS_fnc_taskCreate;

    if !(isNil "_reconMission") then {
        DEBUG2("%1 assigned", _reconMission);
        [_unit, "coopr_mission_recon"] call coopr_fnc_initMissionTracker;
        _unit setVariable [COOPR_CHAR_ACTIVE_MISSION, _missionId, true];
        [_reconDestination, _missionId, "RECON"] call coopr_fnc_createMissionMarker;
        [(_missionId call coopr_fnc_serializeMission)] spawn coopr_fnc_saveMission;
        private _characterID = _unit getVariable [COOPR_CHAR_CHARACTER_ID, -1];
        [_characterID, _missionId] call coopr_fnc_initReconReport;
        _unit setVariable [COOPR_CHAR_IN_RECON, true, true];
        COOPR_RECON_ROUTINE_TOGGLE = true;
        true;
    } else {
        ERROR("could not assign mission.");
        false;
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
}

