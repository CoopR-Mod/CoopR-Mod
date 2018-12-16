#include "script_component.hpp"
params [["_vehicleNpc", objNull]];

if (_vehicleNpc isEqualTo objNull) exitWith { ERROR("_vehicleNpc variable was not set") };

_vehicleNpc addAction [localize "str.coopr.core.action.vehicles", {call coopr_fnc_addVehicleKeyWest},[],1.5,true,true,"","!('ACE_key_west' in items _this)",3];

FLOG("initialized %1 as vehicle npc", _vehicleNpc);
