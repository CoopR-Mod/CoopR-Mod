#include "..\globals.hpp"
#include "constants.hpp"

// VCOM AI stealing workaround
[{{driver _x setVariable ["NOAI",true];} forEach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

// regular events
["CAManBase", "killed", {call X11_fnc_onKilled}] call CBA_fnc_addClassEventHandler;
[INSURGENT_CLASS, "init", {call X11_fnc_addRandomIntelItem}] call CBA_fnc_addClassEventHandler;

// trigger events
escape_zone setTriggerStatements ["this", "call X11_fnc_onEscape", ""];

["server events initialized", DEBUG_STR_SERVER_INIT, DEBUG_CFG] call CBA_fnc_debug;
