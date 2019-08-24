#include "script_component.hpp"

private _ctrl = _this select 0;
private _characterID = player getVariable [COOPR_CHAR_CHARACTER_ID, -1];

[[_characterID], "coopr_fnc_getEntriesForCharacter", [_ctrl], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_ctrl"];

    private _reconEntries = _promisedResult;

    private _entryRemoveCombo = _ctrl getVariable ["_entryRemoveCombo", objNull];
    private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];

    if (_entryRemoveCombo isEqualTo objNull) exitWith { ERROR("_entryRemoveCombo was objNull") };
    if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was objNull") };

    private _selection = lbCurSel _entryRemoveCombo;
    private _selectedEntry = _entryRemoveCombo lbData _selection;

    DEBUG2("removing entry at %1", _selectedEntry);
    private _entryToRemove = _reconEntries select (parseNumber _selectedEntry);
    private _idToRemove = [_entryToRemove, COOPR_CHAR_RECON_ENTRY_ID] call CBA_fnc_hashGet;
    [_idToRemove] remoteExec ["coopr_fnc_removeReconEntry", EXEC_SERVER];
    lbClear _entryRemoveCombo;
    { _entryRemoveCombo lbAdd str (_forEachIndex + 1); _entryRemoveCombo lbSetData [_forEachIndex, str _forEachIndex] } forEach _reconEntries;

    playSound "coopr_sound_pencil_erasing";
    [_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;

}] call coopr_fnc_promise; // coopr_fnc_getEntriesForCharacter
