#include "script_component.hpp"

[_disableVCOM, 1, []] call CBA_fnc_addPerFrameHandler;

//[{call coopr_fnc_syncPlayersToServer;},  SYNC_RATE_MIN * 60] call CBA_fnc_addPerFrameHandler;
//TODO: only call this when in lobby
[{call coopr_fnc_checkCharacterWIAStates;}, 10] call CBA_fnc_addPerFrameHandler;

// regular events
["CAManBase", "killed", { call coopr_fnc_onKilled }] call CBA_fnc_addClassEventHandler;

INFO("server events initialized");
