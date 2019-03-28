#include "script_component.hpp"

private _ctrl = _this select 0;

private _entryRemoveCombo = _ctrl getVariable ["_entryRemoveCombo", objNull];
private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];
private _reconEntries = player getVariable [COOPR_KEY_RECON_ENTRIES, []];

if (_entryRemoveCombo isEqualTo objNull) exitWith { ERROR("_entryRemoveCombo was objNull") };
if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };

private _selection = lbCurSel _entryRemoveCombo;
private _selectedEntry = _entryRemoveCombo lbData _selection;

DEBUG2("removing entry at %1", _selectedEntry);
_reconEntries deleteAt (parseNumber _selectedEntry);
lbClear _entryRemoveCombo;
{ _entryRemoveCombo lbAdd str (_forEachIndex + 1); _entryRemoveCombo lbSetData [_forEachIndex, str _forEachIndex] } forEach _reconEntries;

player setVariable [COOPR_KEY_RECON_ENTRIES, _reconEntries];

playSound "coopr_sound_pencil_erasing";
[_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;
