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

_requestButton setVariable ["supportVehicleClass", _this select 3];

// add events
_requestButton ctrlAddEventHandler ["MouseButtonDown", {
    private _buttonCtrl = _this select 0;
    private _supportVehicleClass = _buttonCtrl getVariable ["supportVehicleClass", objNull];
    _supportVehicleClass call coopr_fnc_requestSupply;
}];
