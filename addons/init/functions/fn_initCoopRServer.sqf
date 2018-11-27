#include "script_component.hpp"

if(isServer) then {
    true call coopr_fnc_sync;

    LSTART("INIT SERVER");

    call coopr_fnc_initPromise;
    call coopr_fnc_initEventsServer;
    call coopr_fnc_staticData;
    call coopr_fnc_initNpcs;

    SLOG("server initialized");

    LEND("INIT SERVER");
}

