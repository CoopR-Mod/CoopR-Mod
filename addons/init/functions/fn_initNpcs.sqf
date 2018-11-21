#include "script_component.hpp"

if (!isNil COOPR_NPC_VEHICLE) then { call coopr_fnc_initKeymaster; };
if (!isNil COOPR_NPC_INTEL) then { call coopr_fnc_initIntelmaster; };
if (!isNil COOPR_NPC_VENDOR) then { call coopr_fnc_initVendor; };
if (!isNil COOPR_NPC_COMMANDER) then { call coopr_fnc_initCommander; };
