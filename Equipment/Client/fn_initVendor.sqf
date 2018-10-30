#include "..\constants.hpp"

private _vendorNpc = GLOB(DPL_NPC_VENDOR);

if(isServer) then{
    _vendorNpc setBehaviour "CARELESS";
    [_vendorNpc,"LEAN_ON_TABLE","ASIS", dpl_snap_arrow_2] call BIS_fnc_ambientAnim;
} else {
    _vendorNpc addAction [localize "str.dpl.equipment.action.vendor", {call X11_fnc_showEquipmentVendorShop},[],1.5,true,true,"","true",3];
};

FLOG("%1 initialized", DPL_NPC_VENDOR);
