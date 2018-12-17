#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;

INTEGRATE_ACE3 = _logic getVariable ["ACE3", false] && call coopr_fnc_isACE3Active;
INTEGRATE_ALIVE = _logic getVariable ["ALIVE", false];

DEBUG2("integrate ACE3: %1", INTEGRATE_ACE3);
DEBUG2("integrate ALiVE: %1", INTEGRATE_ALIVE);
