#include "script_component.hpp"

private _supportVehicleClass = _this select 3;
DEBUG(_supportVehicleClass);
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

_requestButton setVariable ["supportVehicleClass", _this select 3];
_requestButton setVariable ["ammoEdit", _ammoEdit];
_requestButton setVariable ["equipmentEdit", _equipmentEdit];

// add events
_requestButton ctrlAddEventHandler ["MouseButtonDown", {
    private _buttonCtrl = _this select 0;
    private _payLoad = [];
    private _supportVehicleClass = _buttonCtrl getVariable ["supportVehicleClass", objNull];
    private _ammoEdit = _buttonCtrl getVariable ["ammoEdit", objNull];
    private _equipmentEdit = _buttonCtrl getVariable ["equipmentEdit", objNull];

    private _ammoAmount = ctrlText _ammoEdit;
    _ammoEdit ctrlSetText "";

    _payload set [0, _ammoAmount];

    [_supportVehicleClass, [_ammoAmount]] call coopr_fnc_requestSupply;
}];
