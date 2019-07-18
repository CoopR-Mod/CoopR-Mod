#include "script_component.hpp"

disableSerialization;

private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];
if !(player call coopr_fnc_isInTaskArea) exitWith {
    [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["You need to be in the recon task area"]] call CBA_fnc_notify;
};

createDialog "CoopR_ReconReport_Dialog";
waitUntil {!isNull findDisplay GUI_ID_RECON_REPORT_DIALOG};

private _effect = ppEffectCreate ["DynamicBlur", 10];
_effect ppEffectEnable true;
_effect ppEffectAdjust [10];
_effect ppEffectCommit 0.1;


// promise for recon entries
[[_characterID], "coopr_fnc_getEntriesForCharacter", [_effect], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_effect"];
    private _reconEntries = _promisedResult;
    DEBUG2("found %1 recon entries", count _reconEntries);

    private _reconRepDisplay = findDisplay GUI_ID_RECON_REPORT_DIALOG;
    _reconRepDisplay setVariable ["effect", _effect];
    _reconRepDisplay displayAddEventHandler ["Unload", { ppEffectDestroy ((_this select 0) getVariable "effect")} ];

    // controls
    private _typeSelection = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_TYPE_COMBO;
    private _strengthSelection = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_STRENGTH_COMBO;
    private _behaviourSelection = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_BEHAVIOUR_COMBO;
    private _markerNameEdit = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_MARKER_EDIT;
    private _entriesTextbox = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORTS_ENTRIES_STRUCT;
    private _buttonWriteReport = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_WRITE_BUTTON;
    private _entryRemoveCombo = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_ENTRYREMOVE_COMBO;
    private _buttonRemoveReport = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_REMOVE_BUTTON;
    private _senderLabel = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_SENDER_LABEL;
    private _timeLabel = _reconRepDisplay displayCtrl GUI_ID_RECON_REPORT_TIME_LABEL;

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

    // list box event
    _typeSelection setVariable ["_strengthSelection", _strengthSelection];
    _typeSelection setVariable ["_behaviourSelection", _behaviourSelection];
    _typeSelection ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_selectType} ];

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

}] call coopr_fnc_promise;
