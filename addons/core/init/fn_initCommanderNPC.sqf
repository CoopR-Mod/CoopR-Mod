#include "script_component.hpp"
params [["_commander", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

if (COOPR_TASKS_ACTIVE) then {
    _taskActionHandler = {
        private _player = _this select 1;
        if (not (_player call coopr_fnc_hasActiveTask)) then {
            call coopr_fnc_requestCooprTask;
        } else {
           [[COOPR_LOGO_SMALL], ["Tasks:", 1.3, COOPR_BRAND_COLOR], ["already has a task"]] call CBA_fnc_notify;
        };
    };

    if (INTEGRATE_ACE3) then {
        _commander call coopr_fnc_ace3_initCommander;
    } else {
        // after action report action
        private _aarActionCondition = { _this call coopr_fnc_hasActiveTask };
        _commander addAction [localize "str.coopr.aar.action.commander", { call coopr_fnc_deliverAfterActionReport }, [], 1.5, true, true, "", _aarActionCondition call coopr_fnc_codeAsString, 3];

        DEBUG2("initialized %1 as commander", _commander);
    };
}
