#include "script_component.hpp"

private _intelNpc = GLOB(COOPR_NPC_INTEL);
private _intelAssistNpc = GLOB(COOPR_NPC_INTEL_ASSIST);

if (isServer) then {
    _intelNpc setBehaviour "CARELESS";
    [_intelNpc,"AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
    _intelAssistNpc setBehaviour "CARELESS";
    [_intelAssistNpc,"LEAN_ON_TABLE","ASIS", coopr_snap_arrow_1] call BIS_fnc_ambientAnim;
};
_intelNpc addAction [localize "str.coopr.intel.action.deliver", {call coopr_fnc_deliverIntel},[],1.5,true,true,"","true",3];

FLOG("%1 initialized", COOPR_NPC_INTEL);

