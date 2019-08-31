#include "script_component.hpp"

COOPR_MISSIONS_ACTIVE = false;
COOPR_LOG_CONFIG = EMPTY_HASH2;
COOPR_RECON_ROUTINE_TOGGLE = false;

private _machine = "[Client] ";
["log config initialized", _machine + "COOPR.LOGGER", DEBUG_CFG] call CBA_fnc_debug;

publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
publicVariable "COOPR_LOG_CONFIG";
publicVariable "COOPR_MISSIONS_ACTIVE";
