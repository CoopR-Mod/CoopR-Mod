#include "script_component.hpp"

params [["_logic", objNull]];

// Boilerplate logging system initialization. Please do not remove if you want CoopR Logging to work
private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];
// -------------------------------------------------------------------------------------------------


true
