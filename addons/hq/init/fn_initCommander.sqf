#include "script_component.hpp"

params [["_logic", objNull]];

if(isServer) then {

    private _commander = synchronizedObjects _logic;
    if (_commander isEqualTo objNull) exitWith { ERROR("_commander was not defined") };
    if(count _commander == 0) exitWith { SETUPERROR("Commander Module has no synced units!") };

    {
        if (COOPR_MISSIONS_ACTIVE) then {
            if (COOPR_ACE3) then {
                _x call coopr_fnc_ace3_initCommander;
            } else {
                // after action report action
                private _aarActionCondition = { _this call coopr_fnc_hasActiveMission };
                _x addAction [localize "str.coopr.aar.action.commander", { call coopr_fnc_deliverAfterActionReport }, [], 1.5, true, true, "", _aarActionCondition call coopr_fnc_codeAsString, 3];

                DEBUG2("initialized %1 as hq commander", _x);
            };
        };
    } forEach _commander;

    true;
} else {
    SERVER_ONLY_ERROR(__FILE__);
    false;
};
