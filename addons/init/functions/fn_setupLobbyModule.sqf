#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;

if (count _syncedObjects == 0) exitWith { SETUPERROR("Lobby Module has no synced units!") };
//TODO: Check if lobby is synced to a HQ module
if (count _syncedObjects > 1) exitWith { SETUPERROR("Lobby Module can only be synced to one HQ Module!") };

private _sideLobby = _syncedObjects getVariable ["Side", ""];

FLOG("Position of Lobby is: %1", getPos _logic);
FLOG("Lobby is synced to HQ: %1", _syncedObjects);
FLOG("Side of HQ is: %1", _sideLobby);

[_sideLobby, _logic] call coopr_fnc_initLobby;

true
