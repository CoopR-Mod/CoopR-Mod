#include "script_component.hpp"

params [["_armory", objNull]];

if (_armory isEqualTo objNull) exitWith { SETUPERROR("_armory variable was not set") };

if (COOPR_ACE3) then {
    _armory call coopr_fnc_ace3_initArmory;
} else {
    _armory addAction [localize "str.coopr.armory.action", {call coopr_fnc_showArmoryDialog},[],1.5,true,true,"","true",3];
    DEBUG2("initialized %1 as armory", _armory);
};


