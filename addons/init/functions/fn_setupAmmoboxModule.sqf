#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
FLOG("Ammobox Module - synced objects: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { ERROR("Ammobox Module has no synced objects!") }; 
{ _x call coopr_fnc_initAmmobox } forEach _syncedObjects;

true
