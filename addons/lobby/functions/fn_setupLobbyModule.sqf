#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];

[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

private _syncedObjects = synchronizedObjects _logic;
DEBUG2("Position of Lobby is: %1", getPos _logic);
[_logic] call coopr_fnc_initLobby;

true
