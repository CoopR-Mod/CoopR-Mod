#include "script_component.hpp"

// action handler arguments
private _supplyVehicleClass = (_this select 3) select 0;
private _supplyDeliveryTime = (_this select 3) select 1;

disableSerialization;

createDialog "CoopR_Supply_Dialog";
waitUntil {!isNull findDisplay 1104};

private _display = findDisplay 1104;

private _ammoLabel = _display displayCtrl 11041;
private _equipmentLabel = _display displayCtrl 11042;
private _ammoEdit = _display displayCtrl 11043;
private _equipmentEdit = _display displayCtrl 11044;
private _requestButton = _display displayCtrl 11045;

_ammoLabel ctrlSetText localize "str.coopr.supply.ammo.label";
_equipmentLabel ctrlSetText localize "str.coopr.supply.equipment.label";

_requestButton setVariable ["supplyVehicleClass", _supplyVehicleClass];
_requestButton setVariable ["supplyDeliveryTime", _supplyDeliveryTime];
_requestButton setVariable ["ammoEdit", _ammoEdit];
_requestButton setVariable ["equipmentEdit", _equipmentEdit];

// add events
_requestButton ctrlAddEventHandler ["MouseButtonDown", {
    private _buttonCtrl = _this select 0;
    private _payLoad = [];
    private _supplyVehicleClass = _buttonCtrl getVariable ["supplyVehicleClass", objNull];
    private _supplyDeliveryTime = _buttonCtrl getVariable ["supplyDeliveryTime", -1];
    private _ammoEdit = _buttonCtrl getVariable ["ammoEdit", objNull];
    private _equipmentEdit = _buttonCtrl getVariable ["equipmentEdit", objNull];

    if (_supplyVehicleClass isEqualTo objNull) exitWith { ERROR("no vehicle class for supply specificed")};
    if (_supplyDeliveryTime isEqualTo -1) exitWith { ERROR("no delivery time for supply specificed")};

    private _ammoAmount = ctrlText _ammoEdit;
    _ammoEdit ctrlSetText "";

    _payload set [0, _ammoAmount];

    [_supplyVehicleClass, _supplyDeliveryTime, [_ammoAmount]] call coopr_fnc_requestSupply;
}];
