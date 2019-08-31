#include "script_component.hpp"

params [["_logic", objNull]];

private _machine = "[Client] ";
COOPR_LOG_CONFIG = EMPTY_HASH2;
["log config initialized", _machine + "COOPR.LOGGER", DEBUG_CFG] call CBA_fnc_debug;
publicVariable "COOPR_LOG_CONFIG";

if (isServer) then {
    COOPR_RECON_ROUTINE_TOGGLE = false;
    publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
