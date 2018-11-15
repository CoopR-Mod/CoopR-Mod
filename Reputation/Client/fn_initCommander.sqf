#include "..\constants.hpp"

private _commander = GLOB(DPL_NPC_COMMANDER);

if (isServer) then {
    _commander setBehaviour "CARELESS";
    [_commander, "AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
};
if (isClass (configfile >> "CfgPatches" >> "ace_common")) then {
  [_commander, 1, ["ACE_SelfActions", "reputation_action_0"],
    ["reputation_action_1", localize "str.dpl.reputation.action.commander", "", {call X11_fnc_deliverAfterActionReport}, {true}] call ace_interact_menu_fnc_createAction
  ] call ace_interact_menu_fnc_addActionToObject;
} else {
  _commander addAction [localize "str.dpl.reputation.action.commander", {call X11_fnc_deliverAfterActionReport},[],1.5,true,true,"","true",3];
};

FLOG("%1 initialized", DPL_NPC_COMMANDER);
