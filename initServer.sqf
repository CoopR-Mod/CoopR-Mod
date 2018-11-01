#include "globals.hpp"

true call X11_fnc_debug;
true call X11_fnc_sync;

LSTART("INIT SERVER");

call X11_fnc_initPromise;
call X11_fnc_initEventsServer;
call X11_fnc_staticData;
call X11_fnc_initNpcs;
call X11_fnc_initBoxes;

SLOG("server initialized");

LEND("INIT SERVER");

