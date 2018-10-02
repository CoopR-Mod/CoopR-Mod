
#include "..\constants.hpp"

[vendor,"STAND_1","ASIS"] call BIS_fnc_ambientAnim;
vendor addAction [localize "str.dpl.equipment.action.vendor", {call X11_fnc_showEquipmentVendorShop},[],1.5];

["vendor initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
