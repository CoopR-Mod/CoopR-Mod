#include "..\constants.hpp"

private _intelNpc = GLOB(DPL_NPC_INTEL);
private _intelAssistNpc = GLOB(DPL_NPC_INTEL_ASSIST);

if (isServer) then {
    _intelNpc setBehaviour "CARELESS";
    [_intelNpc,"AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
    _intelAssistNpc setBehaviour "CARELESS";
    [_intelAssistNpc,"LEAN_ON_TABLE","ASIS", dpl_snap_arrow_1] call BIS_fnc_ambientAnim;
};
_intelNpc addAction [localize "str.dpl.intel.action.deliver", {call X11_fnc_deliverIntel},[],1.5,true,true,"","true",3];

FLOG("%1 initialized", DPL_NPC_INTEL);

