#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will check all predicates for a assigned mission to be fulfilled so the after action report
 * can be delivered succesfully
 *
 * Arguments:
 * 0: _unit <OBJECT> - the unit the mission requirements should be checked for
 *
 * Return Value:
 * Boolean - if all requirements were fulfilled
 *
 * Example:
 * [_unit] call coopr_fn_checkMissionRequirements;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _activeMission = _unit getVariable [COOPR_CHAR_ACTIVE_MISSION, objNull];
    private _missionTracker = _player getVariable [COOPR_MISSION_TRACKER, []];
    if (_activeMission isEqualTo objNull) exitWith { ERROR("_activeMission was objNull"); false; };
    private _type = [_missionTracker, COOPR_MISSION_TRACKER_TYPE] call CBA_fnc_hashGet;
    private _killCount = [_missionTracker, COOPR_MISSION_TRACKER_KILL_COUNT] call CBA_fnc_hashGet;

    switch (_type) do {
        case COOPR_MISSION_TYPE_SNIPERTEAM: {
            if (_killCount > 0) then {
                true;
            } else { false };
        };
        default {true}
    };

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
