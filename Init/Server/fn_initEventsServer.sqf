#include "..\constants.hpp"

[{{driver _x setVariable ["VCM_Disable",true];} forEach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

[{call X11_fnc_syncPlayersToServer;},  SYNC_RATE_MIN * 60] call CBA_fnc_addPerFrameHandler;

// regular events
["CAManBase", "killed", {call X11_fnc_onKilled}] call CBA_fnc_addClassEventHandler;
[INSURGENT_CLASS, "init", {call X11_fnc_addRandomIntelItem}] call CBA_fnc_addClassEventHandler;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onOutbreak", ""];

SLOG("server events initialized");
