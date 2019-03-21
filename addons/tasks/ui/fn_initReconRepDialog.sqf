#include "script_component.hpp"

disableSerialization;
waitUntil {!isNull findDisplay 1105};

DEBUG("initialising recon rep ui");

private _reconRepDisplay = findDisplay 1105;
// controls
private _typeSelection = _reconRepDisplay displayCtrl 11051;
private _strengthSelection = _reconRepDisplay displayCtrl 11052;
private _behaviourSelection = _reconRepDisplay displayCtrl 11053;
private _additionalInfoTextbox = _reconRepDisplay displayCtrl 11054;
private _buttonWriteReport = _reconRepDisplay displayCtrl 11055;
private _entriesTextbox = _reconRepDisplay displayCtrl 11056;

// init selection boxes
{ _typeSelection lbAdd _x; } forEach COOPR_RECONREP_TYPE_OPTIONS;
{ _strengthSelection lbAdd _x; } forEach COOPR_RECONREP_STRENGTH_OPTIONS;
{ _behaviourSelection lbAdd _x; } forEach COOPR_RECONREP_BEHAVIOUR_OPTIONS;

// set data to button
_buttonWriteReport setVariable ["_typeSelection", _typeSelection];
_buttonWriteReport setVariable ["_strengthSelection", _strengthSelection];
_buttonWriteReport setVariable ["_behaviourSelection", _behaviourSelection];
_buttonWriteReport setVariable ["_additionalInfoTextbox", _additionalInfoTextbox];
_buttonWriteReport setVariable ["_entriesTextbox", _entriesTextbox];

_buttonWriteReport ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_writeEntry}];

DEBUG("recon rep ui initialized");
