#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];

[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;

private _syncedObjects = synchronizedObjects _logic;
FLOG("Position of Lobby is: %1", getPos _logic);
[_logic] call coopr_fnc_initLobby;

true
