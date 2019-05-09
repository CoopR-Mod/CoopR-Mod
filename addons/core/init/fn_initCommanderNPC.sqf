#include "script_component.hpp"
params [["_commander", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

if (COOPR_TASKS_ACTIVE) then {
    if (INTEGRATE_ACE3) then {
        _commander call coopr_fnc_ace3_initCommander;
    } else {
        // after action report action
        private _aarActionCondition = { _this call coopr_fnc_hasActiveTask };
        _commander addAction [localize "str.coopr.aar.action.commander", { call coopr_fnc_deliverAfterActionReport }, [], 1.5, true, true, "", _aarActionCondition call coopr_fnc_codeAsString, 3];

        DEBUG2("initialized %1 as commander", _commander);
    };
}
