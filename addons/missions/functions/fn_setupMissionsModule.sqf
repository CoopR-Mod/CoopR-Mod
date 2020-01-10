#include "script_component.hpp"

#define COOPR_SYSTEM 0
#define ALIVE_SYSTEM 1
#define DISABLED_SYSTEM 2

params [["_logic", objNull]];

if(isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    private _missionSystem = _logic getVariable ["MissionSystem", DISABLED_SYSTEM];
    private _missionItems = call compile (_logic getVariable ["MissionRequestItems", []]);
    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    COOPR_RECON_OBJECTIVE_CACHE = [];
    publicVariable "COOPR_RECON_OBJECTIVE_CACHE";

    if (isNil "_missionItems") exitWith {SETUPERROR("no mission items have been defined") };
    if (_missionItems isEqualTo []) then { SETUPERROR("no mission items have been defined")};

    switch (_missionSystem) do {
        case COOPR_SYSTEM: { [_missionItems] remoteExec ["coopr_fnc_initCooprMissionSystem", EXEC_GLOBAL, true] };
        case ALIVE_SYSTEM: { [_missionItems] remoteExec ["coopr_fnc_initALiVEMissionSystem", EXEC_GLOBAL, true] };
        case DISABLED_SYSTEM: { INFO("mission system disabled") };
    };

    true
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
