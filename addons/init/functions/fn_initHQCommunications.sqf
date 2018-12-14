#include "script_component.hpp"

params [["_communcations", []],
        ["_supplyVehicleClass", objNull],
        ["_supplyDeliveryTime", -1]];

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Request Supply",
     coopr_fnc_showSupplyMenu, [_supplyVehicleClass, _supplyDeliveryTime], 0.5, true, true, "", "true"];
} forEach _communcations;

