#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will check all predicates for a assigned task to be fulfilled so the after action report
 * can be delivered succesfully
 *
 * Arguments:
 * 0: _unit <OBJECT> - the unit the task requirements should be checked for
 *
 * Return Value:
 * Boolean - if all requirements were fulfilled
 *
 * Example:
 * [_unit] call coopr_fn_checkTaskRequirements;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _activeTask = _unit getVariable [COOPR_KEY_ACTIVE_TASK, objNull];
    private _taskTracker = _player getVariable [COOPR_KEY_TASK_TRACKER, []];
    if (_activeTask isEqualTo objNull) exitWith { ERROR("_activeTask was objNull") };
    private _type = [_taskTracker, COOPR_KEY_TASK_TRACKER_TYPE] call CBA_fnc_hashGet;
    private _killCount = [_taskTracker, COOPR_KEY_TASK_TRACKER_KILL_COUNT] call CBA_fnc_hashGet;

    switch (_type) do {
        case COOPR_TASK_TYPE_SNIPERTEAM: {
            if (_killCount > 0) then {
                true;
            } else { false };
        };
        default {true}
    };

} else {
    SERVER_ONLY_ERROR;
};