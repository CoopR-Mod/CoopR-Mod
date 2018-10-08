#include "globals.hpp"

params ["_player", "_JIP"];
LSTART("INIT CLIENT");
call X11_fnc_initPromise;
call X11_fnc_initEventsClient;
call X11_fnc_initNpcs;

[] spawn {
    waitUntil { !(isNull (findDisplay 46)) };
    call X11_fnc_spawnInLobby;
    [] spawn X11_fnc_showLoginDialog;
};

["client initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
LEND("INIT CLIENT");

