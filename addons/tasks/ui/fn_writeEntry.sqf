#include "script_component.hpp"

private _ctrl = _this select 0;

private _typeSel = _ctrl getVariable ["_typeSelection", objNull];
private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];
private _additionalTextbox = _ctrl getVariable ["_additionalInfoTextbox", objNull];

private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

if (_typeSel isEqualTo objNull) exitWith { ERROR("_typeSel was objNull") };
if (_strengthSel isEqualTo objNull) exitWith { ERROR("_strengthSel was objNull") };
if (_behaviourSel isEqualTo objNull) exitWith { ERROR("_behaviourSel was objNull") };
if (_additionalTextbox isEqualTo objNull) exitWith { ERROR("_additionalTextbox was objNull") };
if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };

// get select box values
private _type = _typeSel lbData (lbCurSel _typeSel);
private _strength = _strengthSel lbData (lbCurSel _strengthSel);
private _behaviour = _behaviourSel lbData (lbCurSel _behaviourSel);
private _additional = _additionalTextbox lbData (lbCurSel _additionalTextbox);

private _entryText = format ["%1,%2,%3:%4", _type, _strength, _behaviour, _additional];
_reconEntries pushBack _entryText;
player setVariable [COOPR_KEY_RECON_ENTRIES, _reconEntries];
