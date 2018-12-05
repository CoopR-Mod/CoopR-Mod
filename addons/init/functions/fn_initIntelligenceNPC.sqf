#include "script_component.hpp"
params [["_intelligence", objNull]];

if (_intelligence isEqualTo objNull) exitWith { ERROR("_intelligence variable was not set") };

_intelligence addAction [localize "str.coopr.intel.action.deliver", {call coopr_fnc_deliverIntel},[],1.5,true,true,"","true",3];

FLOG("initialized %1 as intelligence", _intelligence);
