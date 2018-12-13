#include "script_component.hpp"

params [["_communcations", []],
        ["_supplyVehicleClass", objNull]];

if (_supplyVehicleClass isEqualTo objNull) then {
    _supplyVehicleClass = "B_Truck_01_ammo_F";
};
_onCallSupply = {
    private _supplyVehicleClass = _this select 3;
    private _randomPosInsertion = [["coopr_si"]] call BIS_fnc_randomPos;
    private _vehicle = _supplyVehicleClass createVehicle _randomPosInsertion;
    private _randomPosAroundVehicle = [[[getPos _vehicle, 5]],[]] call BIS_fnc_randomPos;
    private _driverGrp = createGroup [west, true];
    private _driver =  _driverGrp createUnit ["B_diver_TL_F", _randomPosAroundVehicle, [], 0, "NONE"];
    _driver moveInDriver _vehicle;
    _driverGrp move getPos COOPR_HQ_WEST;
};

{
    (missionNamespace getVariable ([_x, " ", ""] call coopr_fnc_stringReplace)) addAction ["Call ammo resupply", _onCallSupply, _supplyVehicleClass, 0.5, true, true, "", "true"];
} forEach _communcations;

