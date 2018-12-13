#include "script_component.hpp"

params [["_communcations", []]];

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Request Supply", coopr_fnc_showSupplyMenu, _supplyVehicleClass, 0.5, true, true, "", "true"];
} forEach _communcations;

