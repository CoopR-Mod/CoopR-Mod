#include "script_component.hpp"

params [["_armory", objNull]];

if (_armory isEqualTo objNull) exitWith { SETUPERROR("_armory variable was not set") };

if (INTEGRATE_ACE3) then {
    _armory call coopr_fnc_ace3_initArmory;
} else {
    _armory addAction [localize "str.coopr.equipment.action.armory", {call coopr_fnc_showArmoryMenu},[],1.5,true,true,"","true",3];
};

DEBUG2("initialized %1 as armory", _armory);

