#include "..\constants.hpp"

private _vehicleNpc = GLOB(DPL_NPC_VEHICLE);
[_vehicleNpc,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;
_vehicleNpc addAction [localize "str.dpl.init.action.vehicles", {call X11_fnc_addVehicleKeyWest},[],1.5,true,true,"","!('ACE_key_west' in items _this)",3];
FLOG("%1 initialized", DPL_NPC_VEHICLE);
