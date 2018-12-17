#include "script_component.hpp"

if(isServer) then {
    private _setupValid = call coopr_fnc_verifySetup;
    if(_setupValid) then {
        call coopr_fnc_initPromise;
        call coopr_fnc_initEventsServer;
        //call coopr_fnc_staticData;
        INFO("server initialized");
        true call coopr_fnc_sync;
    } else {
        ERROR("Server was not initialized. Setup verification failed");
    };
}

