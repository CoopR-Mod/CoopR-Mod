#include "script_component.hpp"

params [["_logic", objNull]];

private _supplyCommDevices = (_logic getVariable ["SupplyCommunicationDevices", ""]) splitString "," ;
private _supplyVehicleClass = _logic getVariable ["SupplyVehicle", ""];
private _supplyDeliveryTime = _logic getVariable ["SupplyDeliveryTime", -1];
private _supplyInsertionArea = _logic getVariable ["SupplyInsertionArea", ""];
private _supplyArrivalArea = _logic getVariable ["SupplyArrivalArea", ""];

FLOG("Supply Comm Devices: %1", _supplyCommDevices);
FLOG("Supply veh class: %1", _supplyVehicleClass);
FLOG("Supply delivery time: %1", _supplyDeliveryTime);
FLOG("Supply insertion area: %1", _supplyInsertionArea);
FLOG("Supply arrival area: %1", _supplyArrivalArea);

[_supplyCommDevices, _supplyVehicleClass, _supplyDeliveryTime, _supplyInsertionArea, _supplyArrivalArea] call coopr_fnc_initSupply;

true
