
#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];

[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;

private _supplyCommDevices = (_logic getVariable ["SupplyCommunicationDevices", ""]) splitString "," ;
private _supplyVehicleClass = _logic getVariable ["SupplyVehicle", ""];
private _supplyDeliveryTime = _logic getVariable ["SupplyDeliveryTime", -1];
private _supplyInsertionArea = _logic getVariable ["SupplyInsertionArea", ""];
private _supplyArrivalArea = _logic getVariable ["SupplyArrivalArea", ""];

DEBUG("Supply Comm Devices: %1", _supplyCommDevices);
DEBUG("Supply veh class: %1", _supplyVehicleClass);
DEBUG("Supply delivery time: %1", _supplyDeliveryTime);
DEBUG("Supply insertion area: %1", _supplyInsertionArea);
DEBUG("Supply arrival area: %1", _supplyArrivalArea);

[_supplyCommDevices, _supplyVehicleClass, _supplyDeliveryTime, _supplyInsertionArea, _supplyArrivalArea] call coopr_fnc_initSupply;

true
