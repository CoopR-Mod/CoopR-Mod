#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

// TODO: needs to be initialized with perstistent values from DB
COOPR_COUNTER_TASKS = EMPTY_HASH;
publicVariable "COOPR_COUNTER_TASKS";

true
