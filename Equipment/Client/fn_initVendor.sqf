#include "..\..\globals.hpp"
#include "..\constants.hpp"

[vendor,"STAND_1","ASIS"] call BIS_fnc_ambientAnim;
vendor addAction ["Neue Ausruestung beantragen", {call X11_fnc_showEquipmentVendorShop},[],1.5];

["vendor initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;