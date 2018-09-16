#include "..\global.hpp"

// visuals
[repmaster,"STAND_U1","ASIS"] call BIS_fnc_ambientAnim;
repmaster disableAI "ALL";
repmaster switchMove "Acts_C_in1_briefing";

repmaster addAction ["Give dogtags", {call X11_fnc_giveDogTags},[],1.5,true,true,"","true",3];

["keymaster initialized", DEBUG_STR_NPC_INIT, DEBUG_CFG] call CBA_fnc_debug;
