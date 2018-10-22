#include "..\constants.hpp"

private _vendorNpc = GLOB(DPL_NPC_VENDOR);
[_vendorNpc,"STAND_1","ASIS"] call BIS_fnc_ambientAnim;
_vendorNpc addAction [localize "str.dpl.equipment.action.vendor", {call X11_fnc_showEquipmentVendorShop},[],1.5];
FLOG("%1 initialized", DPL_NPC_VENDOR);

