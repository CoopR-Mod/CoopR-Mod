#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
