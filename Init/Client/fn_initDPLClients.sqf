#include "..\constants.hpp"

LSTART("INIT CLIENTS");
call X11_fnc_initPromise;
call X11_fnc_initEventsClient;
call X11_fnc_initNpcs;

[] spawn {
    waitUntil { !(isNull (findDisplay 46)) };
    call X11_fnc_spawnInLobby;
    [] spawn {
        createDialog "X11_Login_Dialog";
        call X11_fnc_initLoginDialog
    };
};

["client initialized", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
LEND("INIT CLIENTS");
