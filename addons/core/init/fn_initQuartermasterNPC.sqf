#include "script_component.hpp"

params [["_quartermaster", objNull]];

if (_quartermaster isEqualTo objNull) exitWith { SETUPERROR("_quartermaster variable was not set") };

if (call coopr_fnc_isACE3Active) then {
    _quartermaster call coopr_fnc_ace3_initQuartermaster;
} else {
    _quartermaster addAction [localize "str.coopr.equipment.action.quartermaster", {call coopr_fnc_showQuartermasterMenu},[],1.5,true,true,"","true",3];
};

FLOG("initialized %1 as quartermaster", _quartermaster);

