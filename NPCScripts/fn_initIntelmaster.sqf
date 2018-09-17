#include "..\globals.hpp"

[intelmaster,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;

hasIntelItem = {
  ("ItemMap" in items _this) or ("ItemRadio" in items _this);
};

intelmaster addAction ["Deliver Intel", {call X11_fnc_deliverIntel},[],1.5,true,true,"","call hasIntelItem;",3];

["intelmaster initialized", DEBUG_STR_NPC_INIT, DEBUG_CFG] call CBA_fnc_debug;
