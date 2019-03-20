#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay 1101};

DEBUG("initialising recon rep ui");

private _reconRepDisplay = findDisplay 1101;
// controls
private _typeSelection = _reconRepDisplay displayCtrl 2500;
private _strengthSelection = _reconRepDisplay displayCtrl 2500;
private _behaviourSelection = _reconRepDisplay displayCtrl 2500;
private _additionalInfoTextbox = _reconRepDisplay displayCtrl 3400;
private _buttonWriteReport = _reconRepDisplay displayCtrl 2600;
private _entriesTextbox = _reconRepDisplay displayCtrl 2600;
// option values
private _typeOptions = [COOPR_RECONREP_TYPE_OPTIONS, []] call CBA_fnc_hashCreate;
private _strengthOptions = [COOPR_RECONREP_STRENGTH_OPTIONS, []] call CBA_fnc_hashCreate;
private _behaviourOptions = [COOPR_RECONREP_BEHAVIOUR_OPTIONS, []] call CBA_fnc_hashCreate;

// init selection boxes
{ _typeSelection lbAdd _x; } forEach _typeOptions;
{ _strengthSelection lbAdd _x; } forEach _strengthOptions;
{ _behaviourSelection lbAdd _x; } forEach _behaviourOptions;
_additionalInfoTextbox ctrlSetText "<enter additional information here>";

// set data to button
_buttonWriteReport setVariable ["_typeSelection", _typeSelection];
_buttonWriteReport setVariable ["_strengthSelection", _strengthSelection];
_buttonWriteReport setVariable ["_behaviourSelection", _behaviourSelection];
_buttonWriteReport setVariable ["_additionalInfoTextbox", _additionalInfoTextbox];
_buttonWriteReport setVariable ["_entriesTextbox", _entriesTextbox];

_buttonWriteReport ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_writeEntry}];

DEBUG("recon rep ui initialized");
