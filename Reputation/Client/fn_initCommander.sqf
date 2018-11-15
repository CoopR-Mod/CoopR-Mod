#include "..\constants.hpp"

private _commander = GLOB(DPL_NPC_COMMANDER);

if (isServer) then {
    _commander setBehaviour "CARELESS";
    [_commander, "AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
};
if (call X11_fnc_isACE3Active) then {
    call X11_fnc_ace3_initCommander;
} else {
  _commander addAction [localize "str.dpl.reputation.action.commander", {call X11_fnc_deliverAfterActionReport},[],1.5,true,true,"","true",3];
};

FLOG("%1 initialized", DPL_NPC_COMMANDER);
