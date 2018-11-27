#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
FLOG("Quartermaster Module - synced units: %1", _syncedObjects);

if(count _syncedObjects == 0) exitWith { ERROR("Quartermaster Module has no synced units!") };
{ _x call coopr_fnc_initQuartermasterNPC } forEach _syncedObjects;

true