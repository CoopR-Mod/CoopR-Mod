#include "script_component.hpp"

#define COOPR_SYSTEM 0
#define ALIVE_SYSTEM 1
#define DISABLED_SYSTEM 2

params [["_logic", objNull]];

if(isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    private _taskSystem = _logic getVariable ["TaskSystem", DISABLED_SYSTEM];
    private _taskItems = call compile (_logic getVariable ["TaskRequestItems", []]);
    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    COOPR_TASKS_ACTIVE = false;
    COOPR_RECON_OBJECTIVE_CACHE = [];
    publicVariable "COOPR_TASKS_ACTIVE";
    publicVariable "COOPR_RECON_OBJECTIVE_CACHE";

    if (isNil "_taskItems") exitWith {SETUPERROR("no task items have been defined") };
    if (_taskItems isEqualTo []) then { SETUPERROR("no task items have been defined")};

    switch (_taskSystem) do {
        case COOPR_SYSTEM: { [_taskItems] remoteExec ["coopr_fnc_initCooprTaskSystem", EXEC_GLOBAL, true] };
        case ALIVE_SYSTEM: { [_taskItems] remoteExec ["coopr_fnc_initALiVETaskSystem", EXEC_GLOBAL, true] };
        case DISABLED_SYSTEM: { INFO("task system disabled") };
    };

    true
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
