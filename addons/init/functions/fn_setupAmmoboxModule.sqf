#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
FLOG("Ammobox Module - synced objects: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { SETUPERROR("ammobox Module has no synced objects!") };
if(count _syncedObjects > 1) exitWith { SETUPERROR("only one ammobox can be synced") };
{ _x call coopr_fnc_initAmmobox } forEach _syncedObjects;

true
