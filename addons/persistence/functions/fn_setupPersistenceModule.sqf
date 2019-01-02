#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    COOPR_PERSISTENCE_LOCATION = _logic getVariable ["PersistenceLocation", -1];
    publicVariable "COOPR_PERSISTENCE_LOCATION";

    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    DEBUG2("persistence location is set to %1" _persistenceLocation);
};
