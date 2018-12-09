#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
FLOG("Position of Lobby is: %1", getPos _logic);
[_logic] call coopr_fnc_initLobby;

true
