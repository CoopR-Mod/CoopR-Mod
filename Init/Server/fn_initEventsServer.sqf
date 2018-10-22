#include "..\constants.hpp"

_disableVCOM = {
    {
        driver _x setVariable ["VCM_Disable",true];
    } forEach (vehicles select {_x isKindOf 'air'});
};

[_disableVCOM, 1, []] call CBA_fnc_addPerFrameHandler;

[{call X11_fnc_syncPlayersToServer;},  SYNC_RATE_MIN * 60] call CBA_fnc_addPerFrameHandler;

// regular events
["CAManBase", "killed", {call X11_fnc_onKilled}] call CBA_fnc_addClassEventHandler;

// trigger events
if (!isNil DPL_ESC_ZONE) then { GLOB(DPL_ESC_ZONE) setTriggerStatements ["this", "call X11_fnc_onOutbreak", ""]; };

SLOG("server events initialized");
