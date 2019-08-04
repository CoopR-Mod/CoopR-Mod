#include "script_component.hpp"

params [["_logic", objNull]];

if (isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    COOPR_PERSISTENCE_LOCATION = _logic getVariable ["PersistenceLocation", -1];
    COOPR_SERVER_ID = str (_logic getVariable ["ServerId", "none"]);
    COOPR_PERSISTENCE_ACTIVE = true;

    if ( false /** Connection to CoopR HQ Server **/) then {

    } else {
        COOPR_PERSISTENCE_HQ_CONNECTION = false;
    };

    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    publicVariable "COOPR_PERSISTENCE_LOCATION";
    publicVariable "COOPR_PERSISTENCE_ACTIVE";
    publicVariable "COOPR_PERSISTENCE_HQ_CONNECTION";
    publicVariable "COOPR_SERVER_ID";

    INFO2("CoopR Server ID: %1", COOPR_SERVER_ID);
    DEBUG2("persistence location is set to %1" _persistenceLocation);
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
