#include "script_component.hpp"

params [["_logic", objNull]];

private _hqSide = _logic getVariable ["Side", ""];
private _faction = _logic getVariable ["Faction", ""];
private _reputationPerMan = _logic getVariable ["ReputationMan", ""];
private _WIAReputation = _logic getVariable ["WIAReputation", ""];
private _supplyCommDevices = (_logic getVariable ["SupplyCommunicationDevices", ""]) splitString "," ;
private _supplyVehicleClass = _logic getVariable ["SupplyVehicle", ""];
private _supplyDeliveryTime = _logic getVariable ["SupplyDeliveryTime", -1];
private _supplyInsertionArea = _logic getVariable ["SupplyInsertionArea", ""];
private _supplyArrivalArea = _logic getVariable ["SupplyArrivalArea", ""];

FLOG("Position of HQ is: %1", getPos _logic);

FLOG("Side of HQ is: %1", _hqSide);
FLOG("Faction of HQ is: %1", _faction);
FLOG("Reputation per Man is: %1", _reputationPerMan);
FLOG("Reputation malus for WIA is: %1", _WIAReputation);

FLOG("Supply Comm Devices: %1", _supplyCommDevices);
FLOG("Supply veh class: %1", _supplyVehicleClass);
FLOG("Supply delivery time: %1", _supplyDeliveryTime);
FLOG("Supply insertion area: %1", _supplyInsertionArea);
FLOG("Supply arrival area: %1", _supplyArrivalArea);

[_hqSide, _faction, _reputationPerMan, _WIAReputation, _logic] call coopr_fnc_initHQ;
[_supplyCommDevices, _supplyVehicleClass, _supplyDeliveryTime, _supplyInsertionArea, _supplyArrivalArea] call coopr_fnc_initSupply;

true
