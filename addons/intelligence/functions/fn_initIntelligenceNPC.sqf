#include "script_component.hpp"

params [["_intelligence", objNull]];

if (_intelligence isEqualTo objNull) exitWith { ERROR("_intelligence variable was not set") };

if (INTEGRATE_ACE3) then {
    _intelligence call coopr_fnc_ace3_initIntelligence;
} else {
    _intelligence addAction [localize "str.coopr.intelligence.action.deliver", {call coopr_fnc_deliverIntel},[],1.5,true,true,"","true",3];
};

DEBUG2("initialized %1 as intelligence", _intelligence);
