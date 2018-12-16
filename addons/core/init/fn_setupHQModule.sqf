#include "script_component.hpp"

params [["_logic", objNull]];

private _hqSide = _logic getVariable ["Side", ""];
private _faction = _logic getVariable ["Faction", ""];

DEBUG2("Position of HQ is: %1", getPos _logic);
DEBUG2("Side of HQ is: %1", _hqSide);
DEBUG2("Faction of HQ is: %1", _faction);

[_hqSide, _faction, _logic] call coopr_fnc_initHQ;

true
