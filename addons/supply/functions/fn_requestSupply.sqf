#include "script_component.hpp"

params [["_supplyVehicleClass", objNull],
        ["_supplyDeliveryTime", -1],
        ["_supplyInsertionArea", ""],
        ["_supplyArrivalArea", ""],
        ["_payload", []]];

if (count _payLoad isEqualTo 0) exitWith { ERROR("no payload given for supply request") };
if (_supplyDeliveryTime isEqualTo -1) exitWith { ERROR("delivery time is not defined") };
if (_supplyInsertionArea isEqualTo "") exitWith { ERROR("insertion area is not defined") };
if (_supplyArrivalArea isEqualTo "") exitWith { ERROR("arrival area is not defined") };

if (_supplyVehicleClass isEqualTo objNull or _supplyVehicleClass isEqualTo "") then {
    _supplyVehicleClass = "B_Truck_01_ammo_F";
};

INFO("supply requested");

[_supplyVehicleClass, _supplyDeliveryTime, _supplyInsertionArea, _supplyArrivalArea, _payLoad] spawn {
    params ["_supplyVehicleClass", "_supplyDeliveryTime", "_supplyInsertionArea", "_supplyArrivalArea", "_payLoad"];
    private _deliveryStartTime = (call coopr_fnc_currentGameTime) + _supplyDeliveryTime * 60;

    waitUntil { (call coopr_fnc_currentGameTime) >= _deliveryStartTime };

    INFO("supply inbound");
    private _ammoAmount = _payLoad select 0;
    private _randomPosInsertion = [[_supplyInsertionArea]] call BIS_fnc_randomPos;
    private _vehicle = _supplyVehicleClass createVehicle _randomPosInsertion;
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    private _randomPosAroundVehicle = [[[getPos _vehicle, 5]],[]] call BIS_fnc_randomPos;
    private _driverGrp = createGroup [west, true];
    private _driver =  _driverGrp createUnit ["B_diver_TL_F", _randomPosAroundVehicle, [], 0, "NONE"];
    _driver moveInDriver _vehicle;
    _vehicle addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", parseNumber (_payLoad select 0)];
    private _randomArrivalPosition = [[_supplyArrivalArea]] call BIS_fnc_randomPos;
    _driverGrp move _randomArrivalPosition;

    DEBUG("wait for unload");
    // wait for vehicle being emptied by players
    waitUntil { _vehicle call coopr_fnc_hasEmptyCargo };
    DEBUG("unloaded - waiting 10s");
    sleep 10;
    DEBUG("moving back");
    _driverGrp move getMarkerPos _supplyInsertionArea;

    waitUntil { getPos (leader _driverGrp) inArea _supplyInsertionArea };
    DEBUG("vehicle is back in insertion");

    { _vehicle deleteVehicleCrew _x } forEach crew _vehicle;
    deleteVehicle _vehicle;
};
