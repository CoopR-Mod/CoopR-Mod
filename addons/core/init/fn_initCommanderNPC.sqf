#include "script_component.hpp"
params [["_commander", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

_taskActionHandler = {
    private _player = _this select 1;
    if (count (_player call BIS_fnc_tasksUnit) <= 0) then {
        call coopr_fnc_alive_requestCooprTask;
    } else {
        systemChat "||CoopR|| This unit already has a task assigned";
    };
};

if (INTEGRATE_ACE3) then {
    _commander call coopr_fnc_ace3_initCommander;
} else {
    private _aarActionCondition = "not ((_this getVariable ['coopr_character_active_task', []]) isEqualTo [])";
    _commander addAction [localize "str.coopr.aar.action.commander", { call coopr_fnc_deliverAfterActionReport }, [], 1.5, true, true, "", _aarActionCondition, 3];

    if (INTEGRATE_ALIVE) then {
        private _requestActionCondition = "(_this getVariable ['coopr_character_active_task', []]) isEqualTo []";
        _commander addAction [localize "str.coopr.task.action.request", _taskActionHandler , [], 1.5,true,true,"", _requestActionCondition, 3];
    };

    DEBUG2("initialized %1 as commander", _commander);
};
