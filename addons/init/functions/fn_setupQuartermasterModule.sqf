#include "script_component.hpp"

params [["_logic", objNull]];

private _syncedObjects = synchronizedObjects _logic;
private _itemRepTemplate = _logic getVariable ["RepItemTemplate", objNull];
FLOG("Quartermaster NPC Module - synced units: %1", _syncedObjects);
FLOG("Item reputation template is: %1", _itemRepTemplate);

if(count _syncedObjects == 0) exitWith { ERROR("Quartermaster Module has no synced units!") };
{ [_x, _itemRepTemplate] call coopr_fnc_initQuartermasterNPC } forEach _syncedObjects;

true