#include "..\constants.hpp"

[keymaster,"STAND_1","ASIS"] call BIS_fnc_ambientAnim;
keymaster addAction ["Get vehicle keys", {call X11_fnc_addVehicleKeyWest},[],1.5,true,true,"","!('ACE_key_west' in items _this)",3];

["keymaster initialized", DEBUG_STR_NPC_INIT, DEBUG_CFG] call CBA_fnc_debug;
