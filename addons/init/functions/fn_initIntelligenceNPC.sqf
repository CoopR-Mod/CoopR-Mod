#include "script_component.hpp"
params [["_intelligence", objNull]];

if (isServer) then {
    _intelligence setBehaviour "CARELESS";
    [_intelligence,"AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
    _intelAssistNpc setBehaviour "CARELESS";
    [_intelAssistNpc,"LEAN_ON_TABLE","ASIS", coopr_snap_arrow_1] call BIS_fnc_ambientAnim;
};
_intelligence addAction [localize "str.coopr.intel.action.deliver", {call coopr_fnc_deliverIntel},[],1.5,true,true,"","true",3];

FLOG("initialized %1 as intelligence", _commander);
