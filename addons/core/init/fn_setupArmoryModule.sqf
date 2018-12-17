#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
DEBUG2("Armory NPC Module - synced units: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { ERROR("Armory Module has no synced units!") };
{ _x call coopr_fnc_initArmoryNPC } forEach _syncedObjects;

true