#include "script_component.hpp"

private _ctrl = _this select 0;

private _typeSel = _ctrl getVariable ["_typeSelection", objNull];
private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];
private _reportMarkername = _ctrl getVariable ["_additionalInfoTextbox", objNull];

private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

if (_typeSel isEqualTo objNull) exitWith { ERROR("_typeSel was objNull") };
if (_strengthSel isEqualTo objNull) exitWith { ERROR("_strengthSel was objNull") };
if (_behaviourSel isEqualTo objNull) exitWith { ERROR("_behaviourSel was objNull") };
if (_reportMarkername isEqualTo objNull) exitWith { ERROR("_reportMarkername was objNull") };
if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };

// get select box values
private _type = _typeSel lbData (lbCurSel _typeSel);
private _strength = _strengthSel lbData (lbCurSel _strengthSel);
private _behaviour = _behaviourSel lbData (lbCurSel _behaviourSel);
private _markerName = _reportMarkername lbData (lbCurSel _reportMarkername);
private _markerPos = getMarkerPos _markerName;

// build hash for entry
private _entryHash = EMPTY_HASH;
[_entryHash, COOPR_KEY_RECON_ENTRY_TYPE, _type] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_STRENGTH, _strength] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_BEHAVIOUR, _behaviour] call CBA_fnc_hashSet;
[_entryHash, COOPR_KEY_RECON_ENTRY_MARKER, _markerName] call CBA_fnc_hashSet;

private _entryText = format ["%1,%2,%3:%4,%5", _type, _strength, _behaviour, _markerPos select 0, _markerPos select 1];

_reconEntries pushBack _entryHash;
player setVariable [COOPR_KEY_RECON_ENTRIES, _reconEntries];
