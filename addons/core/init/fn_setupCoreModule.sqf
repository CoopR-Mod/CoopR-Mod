#include "script_component.hpp"

params [["_logic", objNull]];

private _reputationPerMan = _logic getVariable ["ReputationMan", ""];
private _WIAReputation = _logic getVariable ["WIAReputation", ""];
private _loggingLevel = _logic getVariable ["Logging", -1];

[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_CLIENTS];

DEBUG2("Reputation per Man is: %1", _reputationPerMan);
DEBUG2("Reputation malus for WIA is: %1", _WIAReputation);

[_reputationPerMan, _WIAReputation, _logic] call coopr_fnc_initCore;

true
