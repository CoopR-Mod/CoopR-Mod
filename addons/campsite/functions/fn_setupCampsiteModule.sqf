#include "script_component.hpp"

params [["_logic", objNull]];

if(isServer) then {
    private _loggingLevel = _logic getVariable ["Logging", -1];
    [_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
    [_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

    true
} else {
    SERVER_ONLY_ERROR;
    false;
};
