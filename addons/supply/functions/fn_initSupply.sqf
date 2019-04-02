#include "script_component.hpp"

params [["_supplyCommDevices", []],
        ["_supplyVehicleClass", objNull],
        ["_supplyDeliveryTime", -1],
        ["_supplyInsertionArea", ""],
        ["_supplyArrivalArea", ""]];

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Request Supply", coopr_fnc_showSupplyMenu,
    [_supplyVehicleClass, _supplyDeliveryTime, _supplyInsertionArea, _supplyArrivalArea], 0.5, true, true, "", "true"];
} forEach _supplyCommDevices;
