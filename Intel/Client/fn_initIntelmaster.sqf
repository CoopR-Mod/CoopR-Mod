#include "..\..\globals.hpp"
#include "..\constants.hpp"

[intelmaster,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;

intelmaster addAction ["Deliver Intel", {call X11_fnc_deliverIntel},[],1.5,true,true,"","true",3];

["intelmaster initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
