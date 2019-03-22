#include "script_component.hpp"

private _ctrl = _this select 0;

private _typeSel = _ctrl getVariable ["_typeSelection", objNull];
private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];
private _markerNameEdit = _ctrl getVariable ["_markerNameEdit", objNull];

private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

if (_typeSel isEqualTo objNull) exitWith { ERROR("_typeSel was objNull") };
if (_strengthSel isEqualTo objNull) exitWith { ERROR("_strengthSel was objNull") };
if (_behaviourSel isEqualTo objNull) exitWith { ERROR("_behaviourSel was objNull") };
if (_markerNameEdit isEqualTo objNull) exitWith { ERROR("_markerNameEdit was objNull") };
if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };

// get select box values
private _type = _typeSel lbData (lbCurSel _typeSel);
private _strength = _strengthSel lbData (lbCurSel _strengthSel);
private _behaviour = _behaviourSel lbData (lbCurSel _behaviourSel);
private _markerText = ctrlText _markerNameEdit;
DEBUG2("index: %1", lbCurSel _typeSel);

// search marker by text/description
private _foundMarker = allMapMarkers select { (markerText _x) isEqualTo _markerText};

if ((count _foundMarker) > 1) exitWith {
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["Marker name is not unique"]] call CBA_fnc_notify;
};

if ((count _foundMarker) == 0) exitWith {
   private _message = format ["No marker with name %1", _markerText];
   [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], [_message]] call CBA_fnc_notify;
};

// build hash for entry
private _entryHash = EMPTY_HASH;
[_entryHash, COOPR_KEY_RECON_ENTRY_TYPE, _type] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_STRENGTH, _strength] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_BEHAVIOUR, _behaviour] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_MARKER, _foundMarker select 0] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_TIME, call coopr_fnc_currentGameTime] call CBA_fnc_hashSet;

_reconEntries pushBack _entryHash;
player setVariable [COOPR_KEY_RECON_ENTRIES, _reconEntries];

[_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;
