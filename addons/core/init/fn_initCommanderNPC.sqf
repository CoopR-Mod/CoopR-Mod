#include "script_component.hpp"
params [["_commander", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

if (INTEGRATE_ACE3) then {
    _commander call coopr_fnc_ace3_initCommander;
} else {
    _commander addAction [localize "str.coopr.aar.action.commander", {call coopr_fnc_deliverAfterActionReport},[],1.5,true,true,"","true",3];
    DEBUG2("initialized %1 as commander", _commander);
};

