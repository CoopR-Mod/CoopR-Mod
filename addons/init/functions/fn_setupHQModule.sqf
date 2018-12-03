#include "script_component.hpp"

params [["_logic", objNull]];

private _hqSide = _logic getVariable ["Side", ""];

FLOG("Position of HQ is: %1", getPos _logic);
FLOG("Side of HQ is: %1", _hqSide);

[_hqSide, _logic] call coopr_fnc_initHQ;

true
