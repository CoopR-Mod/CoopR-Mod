#include "script_component.hpp"

params ["_ctrl"];

private _typeSel = _ctrl getVariable ["_typeSelection", objNull];
private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];
private _markerNameEdit = _ctrl getVariable ["_markerNameEdit", objNull];

private _entryRemoveCombo = _ctrl getVariable ["_entryRemoveCombo", objNull];
private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

if (_typeSel isEqualTo objNull) exitWith { ERROR("_typeSel was objNull") };
if (_strengthSel isEqualTo objNull) exitWith { ERROR("_strengthSel was objNull") };
if (_behaviourSel isEqualTo objNull) exitWith { ERROR("_behaviourSel was objNull") };
if (_markerNameEdit isEqualTo objNull) exitWith { ERROR("_markerNameEdit was objNull") };
if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };
if (_entryRemoveCombo isEqualTo objNull) exitWith { ERROR("_entryRemoveCombo was objNull") };

// get select box values
private _type = _typeSel lbData (lbCurSel _typeSel);
private _strength = _strengthSel lbData (lbCurSel _strengthSel);
private _behaviour = _behaviourSel lbData (lbCurSel _behaviourSel);
private _markerText = ctrlText _markerNameEdit;
private _foundMarker = allMapMarkers select { (markerText _x) isEqualTo _markerText };

if (_markerText isEqualTo "") exitWith {
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["No marker name given"]] call CBA_fnc_notify;
};

private _reportAccuracy = [_markerText, _strength, _type, _behaviour] call coopr_fnc_validateReport;
DEBUG2("report accuracy: %1", _reportAccuracy);

if (isNil "_reportAccuracy") exitWith { ERROR("no entry will be written due previous errors")};

// build hash for entry
private _entryHash = EMPTY_HASH;
[_entryHash, COOPR_KEY_RECON_ENTRY_TYPE, _type] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_STRENGTH, _strength] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_BEHAVIOUR, _behaviour] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_MARKER, _foundMarker] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_TIME, call coopr_fnc_currentGameTime] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_TIME, call coopr_fnc_currentGameTime] call CBA_fnc_hashSet;

// set valid report
if (_reportAccuracy > COOPR_ACCURACY_THRESHOLD) then {
    [_entryHash, COOPR_KEY_RECON_ENTRY_VALID, true] call CBA_fnc_hashSet;
} else {
    [_entryHash, COOPR_KEY_RECON_ENTRY_VALID, false] call CBA_fnc_hashSet;
};

_reconEntries pushBack _entryHash;
playSound "coopr_sound_pencil_draw";

// update remove combobox
lbClear _entryRemoveCombo;
{ _entryRemoveCombo lbAdd str (_forEachIndex + 1); _entryRemoveCombo lbSetData [_forEachIndex, str _forEachIndex] } forEach _reconEntries;

player setVariable [COOPR_KEY_RECON_ENTRIES, _reconEntries];
[_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;
