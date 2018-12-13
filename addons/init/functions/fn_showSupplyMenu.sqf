#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_Supply_Dialog";
waitUntil {!isNull findDisplay 1104};

private _display = findDisplay 1104;
private _ammoLabel = _display displayCtrl 11041;
private _equipmentLabel = _display displayCtrl 11042;
private _ammoEdit = _display displayCtrl 11043;
private _equipmentEdit = _display displayCtrl 11044;
private _requestButton = _display displayCtrl 11045;

// add events
_requestButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_requestSupply}];
