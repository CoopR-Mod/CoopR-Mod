#include "script_component.hpp"

params [["_logic", objNull]];

if(isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    private _taskItems = call compile (_logic getVariable ["TaskRequestItems", []]);
    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    if (_taskItems isEqualTo []) then { SETUPERROR("no task items have been defined")};

    COOPR_TASKS_ACTIVE = true;
    COOPR_RECON_OBJECTIVE_CACHE = [];

    publicVariable "COOPR_TASKS_ACTIVE";
    publicVariable "COOPR_RECON_OBJECTIVE_CACHE";

    [_taskItems] call coopr_fnc_initTaskItems;

    true
} else {
    SERVER_ONLY_ERROR;
    false;
};
