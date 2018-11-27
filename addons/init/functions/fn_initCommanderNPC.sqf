#include "script_component.hpp"
params [["_commander", objNull]];

if (_commander isEqualTo objNull) exitWith { ERROR("_commander variable was not set") };

if (isServer) then {
    _commander setBehaviour "CARELESS";
    [_commander, "AidlPercMstpSnonWnonDnon_G02", "ASIS"] call BIS_fnc_ambientAnim;
};

if (call coopr_fnc_isACE3Active) then {
    _commander call coopr_fnc_ace3_initCommander;
} else {
    _commander addAction [localize "str.coopr.reputation.action.commander", {call coopr_fnc_deliverAfterActionReport},[],1.5,true,true,"","true",3];
};

FLOG("initialized %1 as commander", _commander);
