#include "script_component.hpp"

params [["_logic", objNull]];

private _hqSide = _logic getVariable ["Side", ""];
private _faction = _logic getVariable ["Faction", ""];
private _loadoutTemplate = _logic getVariable ["InitLoadout", ""];

FLOG("Position of HQ is: %1", getPos _logic);

if (_hqSide isEqualTo "") then {_hqSide = "West"};
FLOG("Side of HQ is: %1", _hqSide);
FLOG("Faction of HQ is: %1", _faction);
FLOG("Loadout template of HQ is: %1", _loadoutTemplate);

[_hqSide, _faction, _loadoutTemplate, _logic] call coopr_fnc_initHQ;

true
