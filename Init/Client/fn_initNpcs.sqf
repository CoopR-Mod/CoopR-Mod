#include "..\constants.hpp"

if (!isNil DPL_NPC_VEHICLE) then { call X11_fnc_initKeymaster; };
if (!isNil DPL_NPC_INTEL) then { call X11_fnc_initIntelmaster; };
if (!isNil DPL_NPC_VENDOR) then { call X11_fnc_initVendor; };
//if (!isNil DPL_NPC_COMMANDER) then { call X11_fnc_initVendor; };
