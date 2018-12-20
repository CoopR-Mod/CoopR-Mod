#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
DEBUG2("Commander NPC Module - synced units: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { SETUPERROR("Commander Module has no synced units!") };
{ [_x] remoteExec ["coopr_fnc_initCommanderNPC", EXEC_CLIENTS]; } forEach _syncedObjects;

true
