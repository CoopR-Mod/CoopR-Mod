#include "script_component.hpp"

params [["_communcations", []]];

_onCallSupply = {
    private _randomPosInsertion = [["coopr_si"]] call BIS_fnc_randomPos;
    private _vehicle = "B_Truck_01_ammo_F" createVehicle _randomPosInsertion;
    private _randomPosAroundVehicle = [[[getPos _vehicle, 5]],[]] call BIS_fnc_randomPos;
    private _driverGrp = createGroup [west, true];
    private _driver =  _driverGrp createUnit ["B_diver_TL_F", _randomPosAroundVehicle, [], 0, "NONE"];
    _driver moveInDriver _vehicle;
    _driverGrp move getPos COOPR_HQ_WEST;
};

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Call ammo resupply", _onCallSupply , [], 0.5, true, true, "", "true"];
} forEach _communcations;


