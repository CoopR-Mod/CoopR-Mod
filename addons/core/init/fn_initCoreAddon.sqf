#include "script_component.hpp"

COOPR_MISSIONS_ACTIVE = false;
COOPR_RECON_ROUTINE_TOGGLE = false;

publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
publicVariable "COOPR_MISSIONS_ACTIVE";

//if (COOPR_CALL_STACK) then {
    //[{ diag_log "FILE_NAME"},
     //{diag_log "after"},
//     [0,"coopr"]] call coopr_fnc_addFunctionAspects;
//};

if (isServer) then {
    call coopr_fnc_initCoopRServer;
};
