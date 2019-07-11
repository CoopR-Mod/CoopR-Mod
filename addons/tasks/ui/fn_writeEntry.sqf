#include "script_component.hpp"

params ["_ctrl"];
private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];
if (_characterID isEqualTo -1) exitWith { ERROR("_characterID was undefined") };

[[_characterID], "coopr_fnc_getEntriesForCharacter", [_ctrl, _characterID], {
    params ["_callbackArgs", "_promisedResult"];
    _callbackArgs params ["_ctrl", "_characterID"];

    private _reconEntries = _promisedResult;

    private _typeSel = _ctrl getVariable ["_typeSelection", objNull];
    private _strengthSel = _ctrl getVariable ["_strengthSelection", objNull];
    private _behaviourSel = _ctrl getVariable ["_behaviourSelection", objNull];
    private _markerNameEdit = _ctrl getVariable ["_markerNameEdit", objNull];

    private _entryRemoveCombo = _ctrl getVariable ["_entryRemoveCombo", objNull];
    private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];

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
    private _serializedMarkers = [];
    DEBUG2("foundmarker: %1", _foundMarker);

    if (_markerText isEqualTo "") exitWith {
       [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["No marker name given"]] call CBA_fnc_notify;
    };

    private _reconTaskId = player getVariable [COOPR_KEY_ACTIVE_TASK, ""];
    private _markerPos = getMarkerPos _foundMarker;
    if !(_markerPos inArea _reconTaskId + "_task_marker") exitWith {
       [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["Marker was not in recon task area"]] call CBA_fnc_notify;
    };

    private _nameExists = false;

    // check if marker name already has been defined
    {
        private _entry = _x;
        private _serMarkers = [_entry, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
        DEBUG2("serMarker %1", _serMarkers);
        private _entryMarkerDescription = (_serMarkers select 0) select 5; // markerText index
        _nameExists = _entryMarkerDescription isEqualTo markerText (_foundMarker select 0);
    } forEach _reconEntries;

    if (_nameExists) exitWith {
       [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["marker name already exists"]] call CBA_fnc_notify;
    };

    // serialize all markers
    { _serializedMarkers pushBack ([_x] call coopr_fnc_serializeMarker) } forEach _foundMarker;

    // build hash for entry
    private _entryHash = EMPTY_HASH;
    [_entryHash, COOPR_KEY_RECON_ENTRY_OWNER, _characterID] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_TYPE, _type] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_STRENGTH, _strength] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_BEHAVIOUR, _behaviour] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_MARKER, _serializedMarkers] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_LOCATION, str (nearestLocation [getMarkerPos (_foundMarker select 0), ""]) ] call CBA_fnc_hashSet;
    [_entryHash, COOPR_KEY_RECON_ENTRY_TIME, call coopr_fnc_currentGameTime] call CBA_fnc_hashSet;

    [[_entryHash], "coopr_fnc_saveReconEntry", [_entryHash, _ctrl], {
        params ["_callbackArgs", "_promisedResult"];
        _callbackArgs params ["_entryHash", "_ctrl"];
        private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];

        // need to make a second call to be sure entry was persisted in database
        [[_characterID], "coopr_fnc_getEntriesForCharacter", [_ctrl], {
            params ["_callbackArgs", "_promisedResult"];
            _callbackArgs params ["_ctrl"];

            private _reconEntries = _promisedResult;
            private _entryRemoveCombo = _ctrl getVariable ["_entryRemoveCombo", objNull];
            private _entriesTextbox = _ctrl getVariable ["_entriesTextbox", objNull];

            playSound "coopr_sound_pencil_draw";
            // update remove combobox
            lbClear _entryRemoveCombo;
            { _entryRemoveCombo lbAdd str (_forEachIndex + 1); _entryRemoveCombo lbSetData [_forEachIndex, str _forEachIndex] } forEach _reconEntries;
            [_entriesTextbox, _reconEntries] call coopr_fnc_updateReconReportEntries;

        }] call coopr_fnc_promise; // coopr_fnc_getEntriesForCharacter
    }] call coopr_fnc_promise; // coopr_fnc_saveReconEntry

}] call coopr_fnc_promise; // coopr_fnc_getEntriesForCharacter
