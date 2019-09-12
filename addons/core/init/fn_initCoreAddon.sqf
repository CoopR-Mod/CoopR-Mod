#include "script_component.hpp"

COOPR_MISSIONS_ACTIVE = false;
COOPR_RECON_ROUTINE_TOGGLE = false;

publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
publicVariable "COOPR_MISSIONS_ACTIVE";

if (COOPR_CALL_STACK) then {
  [{ diag_log ">> __FUNC_NAME__"},
   {diag_log "<< __FUNC_NAME__"},
   [0,"coopr"]] call coopr_fnc_addFunctionAspects;
};

if (isServer) then {
    call coopr_fnc_initCoopRServer;
};
