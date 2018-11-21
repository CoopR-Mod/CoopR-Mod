#include "script_component.hpp"

private _vendorNpc = GLOB(COOPR_NPC_VENDOR);

if(isServer) then{
    _vendorNpc setBehaviour "CARELESS";
    [_vendorNpc,"LEAN_ON_TABLE","ASIS", coopr_snap_arrow_2] call BIS_fnc_ambientAnim;
};
_vendorNpc addAction [localize "str.coopr.equipment.action.vendor", {call coopr_fnc_showEquipmentVendorShop},[],1.5,true,true,"","true",3];

FLOG("%1 initialized", COOPR_NPC_VENDOR);
