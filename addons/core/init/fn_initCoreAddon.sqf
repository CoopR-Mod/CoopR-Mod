#include "script_component.hpp"

COOPR_MISSIONS_ACTIVE = false;
COOPR_RECON_ROUTINE_TOGGLE = false;

publicVariable "COOPR_RECON_ROUTINE_TOGGLE";
publicVariable "COOPR_MISSIONS_ACTIVE";

if (COOPR_CALL_STACK) then {
    private _beforeAspect = "call coopr_fnc_recordFuncCall;";
    private _afterAspect = "call coopr_fnc_recordFuncCall;";
    //private _cooprFunctions = allVariables missionNamespace select {["coopr_fnc_", _x] call BIS_fnc_inString };
    private _function = missionNamespace getVariable "coopr_fnc_getSkills";

    private _enrichedFunction = {
        call (compile _beforeAspect);
        private _returnValue = call _function;
        call (compile _afterAspect);
        _returnValue;
    };

   missionNamespace setVariable ["coopr_fnc_getSkills", (compile _enrichedFunction)];
};
