#include "script_component.hpp"

COOPR_MISSIONS_ACTIVE = false;
COOPR_RECON_ROUTINE_TOGGLE = false;

publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
publicVariable "COOPR_MISSIONS_ACTIVE";

if (COOPR_CALL_STACK) then {
    private _cooprFunctions = allVariables missionNamespace select {["coopr_fnc_", _x] call BIS_fnc_inString };
    private _functionString = str (missionNamespace getVariable "coopr_fnc_login");
    private _functionStringAsArray = toArray _functionString;
    _functionStringAsArray



 //[isServer, __FILE__] call coopr_fnc_recordFuncCall;
};
