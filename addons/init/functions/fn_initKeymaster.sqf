#include "script_component.hpp"

private _vehicleNpc = GLOB(COOPR_NPC_VEHICLE);

if (isServer) then {
    [_vehicleNpc,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;
};
_vehicleNpc addAction [localize "str.coopr.init.action.vehicles", {call coopr_fnc_addVehicleKeyWest},[],1.5,true,true,"","!('ACE_key_west' in items _this)",3];

FLOG("%1 initialized", COOPR_NPC_VEHICLE);
