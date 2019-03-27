#include "script_component.hpp"

disableSerialization;

createDialog "CoopR_ReconReport_Dialog";
waitUntil {!isNull findDisplay 1105};

DEBUG("initialising recon rep ui");

private _reconRepDisplay = findDisplay 1105;

// controls
private _typeSelection = _reconRepDisplay displayCtrl 11051;
private _strengthSelection = _reconRepDisplay displayCtrl 11052;
private _behaviourSelection = _reconRepDisplay displayCtrl 11053;
private _markerNameEdit = _reconRepDisplay displayCtrl 11054;
private _entriesTextbox = _reconRepDisplay displayCtrl 11055;
private _buttonWriteReport = _reconRepDisplay displayCtrl 11056;
private _entryRemoveCombo = _reconRepDisplay displayCtrl 11057;
private _buttonRemoveReport = _reconRepDisplay displayCtrl 11058;
private _senderLabel = _reconRepDisplay displayCtrl 11059;
private _timeLabel = _reconRepDisplay displayCtrl 110510;
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

_senderLabel ctrlSetText (name player);

_timeLabel ctrlSetText (format ["%1:%2", date select 3, date select 4]);

// init selection boxes
{ _typeSelection lbAdd _x; _typeSelection lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_TYPE_OPTIONS;
{ _strengthSelection lbAdd _x; _strengthSelection lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_STRENGTH_OPTIONS;
{ _behaviourSelection lbAdd _x; _behaviourSelection lbSetData [_forEachIndex, _x] } forEach COOPR_RECONREP_BEHAVIOUR_OPTIONS;
{ _entryRemoveCombo lbAdd str (_forEachIndex + 1); _entryRemoveCombo lbSetData [_forEachIndex, str _forEachIndex] } forEach _reconEntries;

// init select first item
_typeSelection lbSetCurSel 0;
_strengthSelection lbSetCurSel 0;
_behaviourSelection lbSetCurSel 0;

// set data to write button
_buttonWriteReport setVariable ["_typeSelection", _typeSelection];
_buttonWriteReport setVariable ["_strengthSelection", _strengthSelection];
_buttonWriteReport setVariable ["_behaviourSelection", _behaviourSelection];
_buttonWriteReport setVariable ["_markerNameEdit", _markerNameEdit];
_buttonWriteReport setVariable ["_entriesTextbox", _entriesTextbox];
_buttonWriteReport setVariable ["_entryRemoveCombo", _entryRemoveCombo];

// set data to remove button
_buttonRemoveReport setVariable ["_entriesTextbox", _entriesTextbox];
_buttonRemoveReport setVariable ["_entryRemoveCombo", _entryRemoveCombo];

_buttonWriteReport ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_writeEntry}];
_buttonRemoveReport ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_removeEntry}];

// fill already existing entries
[_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;

playSound "coopr_sound_paperfold";
DEBUG("recon rep ui initialized");
