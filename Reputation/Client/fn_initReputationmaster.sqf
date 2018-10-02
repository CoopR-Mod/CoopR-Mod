
#include "..\constants.hpp"

// visuals
[repmaster,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;
repmaster disableAI "ALL";
repmaster switchMove "Acts_C_in1_briefing";

repmaster addAction ["Give dogtags", {call X11_fnc_tradeDogtags},[],1.5,true,true,"","true",3];

["reputationmaster initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
