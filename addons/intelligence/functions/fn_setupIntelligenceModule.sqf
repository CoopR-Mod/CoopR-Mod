#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_CLIENTS];

private _syncedObjects = synchronizedObjects _logic;
DEBUG2("Intelligence NPC Module - synced units: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { ERROR("Intelligence Module has no synced units!") };
{ [_x] remoteExec ["coopr_fnc_initIntelligenceNPC", EXEC_CLIENTS]; } forEach _syncedObjects;

true
