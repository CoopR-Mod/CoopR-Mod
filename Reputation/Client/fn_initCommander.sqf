#include "..\constants.hpp"

private _commander = GLOB(DPL_NPC_COMMANDER);
_commander addAction [localize "str.dpl.reputation.action.commander", {call X11_fnc_deliverAfterActionReport},[],1.5];
