#include "script_component.hpp"

params [["_supplyVehicleClass", objNull]];

if (_supplyVehicleClass isEqualTo objNull or _supplyVehicleClass isEqualTo "") then {
    _supplyVehicleClass = "B_Truck_01_ammo_F";
};

SLOG("supply requested");

private _randomPosInsertion = [["coopr_si"]] call BIS_fnc_randomPos;
private _vehicle = _supplyVehicleClass createVehicle _randomPosInsertion;
private _randomPosAroundVehicle = [[[getPos _vehicle, 5]],[]] call BIS_fnc_randomPos;
private _driverGrp = createGroup [west, true];
private _driver =  _driverGrp createUnit ["B_diver_TL_F", _randomPosAroundVehicle, [], 0, "NONE"];
_driver moveInDriver _vehicle;
_driverGrp move getPos COOPR_HQ_WEST;
