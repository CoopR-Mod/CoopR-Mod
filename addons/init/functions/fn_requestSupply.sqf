#include "script_component.hpp"

params [["_supplyVehicleClass", objNull],
        ["_supplyDeliveryTime", -1],
        ["_payload", []]];

if (count _payLoad isEqualTo 0) exitWith { ERROR("no payload given for supply request") };
if (_supplyDeliveryTime isEqualTo -1) exitWith { ERROR("delivery time is not defined") };

if (_supplyVehicleClass isEqualTo objNull or _supplyVehicleClass isEqualTo "") then {
    _supplyVehicleClass = "B_Truck_01_ammo_F";
};

SLOG("supply requested");

[_supplyVehicleClass, _supplyDeliveryTime, _payLoad] spawn {
    params ["_supplyVehicleClass", "_supplyDeliveryTime", "_payLoad"];
    private _deliveryStartTime = serverTime + _supplyDeliveryTime * 60;
    waitUntil { serverTime >= _deliveryStartTime };

    SLOG("supply inbound");
    private _ammoAmount = _payLoad select 0;
    private _randomPosInsertion = [["coopr_si"]] call BIS_fnc_randomPos;
    private _vehicle = _supplyVehicleClass createVehicle _randomPosInsertion;
    private _randomPosAroundVehicle = [[[getPos _vehicle, 5]],[]] call BIS_fnc_randomPos;
    private _driverGrp = createGroup [west, true];
    private _driver =  _driverGrp createUnit ["B_diver_TL_F", _randomPosAroundVehicle, [], 0, "NONE"];
    _driver moveInDriver _vehicle;
    _vehicle addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", parseNumber (_payLoad select 0)];
    _driverGrp move getPos COOPR_HQ_WEST;
};
