#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Get task by id from local DB
 *
 * Arguments:
 * 0: _taskId <STRING> - the id of the task
 *
 * Return Value:
 * characters <ARRAY> - the ID of the characters table for the given user
 *
 * Example:
 * ["coopr_task_recon_0"] call coopr_fnc_getTask
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_taskId", ""]];


if (isServer) then {

    if (_taskId isEqualTo "") exitWith { ERROR("_taskId was not defined") };

    if(COOPR_PERSISTENCE_LOCATION isEqualTo "Local") then {
        [_taskId] call coopr_fnc_getTaskLocal;
    } else {
        INFO("no persistence location defined - skipping persistence routine");
    };
} else {
    SERVER_ONLY_ERROR(__FILE__);
};

