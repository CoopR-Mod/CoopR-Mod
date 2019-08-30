#include "script_component.hpp"

params [["_logic", objNull]];

if(isServer) then {
    COOPR_RECON_ROUTINE_TOGGLE = false;
    publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
