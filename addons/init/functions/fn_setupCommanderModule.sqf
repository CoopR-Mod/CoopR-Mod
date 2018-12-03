#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
FLOG("Commander NPC Module - synced units: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { ERROR("Commander Module has no synced units!") };
{ _x call coopr_fnc_initCommanderNPC } forEach _syncedObjects;

true