#include "..\constants.hpp"

private _intelNpc = GLOB(DPL_NPC_INTEL);
[_intelNpc,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;
_intelNpc addAction [localize "str.dpl.intel.action.deliver", {call X11_fnc_deliverIntel},[],1.5,true,true,"","true",3];
FLOG("%1 initialized", DPL_NPC_INTEL);

