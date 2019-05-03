#include "script_component.hpp"

params[["_entriesTextbox", objNull],
       ["_entries", []]];

if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was empty string") };
_entriesTextbox ctrlSetStructuredText (parseText ""); // clear textbox
private _entryText = "";

DEBUG("updating recon report entries");
DEBUG2("%1 entries found", count _entries);

{
    DEBUG2("adding entry: %1", _x);
    private _type = [_x, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
    private _strength = [_x, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
    private _behaviour = [_x, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
    private _marker = [_x, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
    private _time = [_x, COOPR_KEY_RECON_ENTRY_TIME] call CBA_fnc_hashGet;
    private _nearestLocation = [_x, COOPR_KEY_RECON_ENTRY_LOCATION] call CBA_fnc_hashGet;
    private _markerPos = [];

    switch (_behaviour) do {
        case COOPR_TASK_BEHAVIOUR_COMBAT: { };
        case COOPR_TASK_BEHAVIOUR_PATROL: { };
        case COOPR_TASK_BEHAVIOUR_DEFENSIVE: {
            _markerPos = getMarkerPos (_marker select 0); // only one marker in array
        };
    };

    DEBUG2("type: %1", _type);
    private _text = format ["%1. %2,%3,%4 %5 time %6", _forEachIndex + 1, _type, _strength, _behaviour, _nearestLocation, _time];
    _entryText = composeText [_entryText, _text, lineBreak];

} forEach _entries;

if (_entryText isEqualTo "") then {
    DEBUG("no entries found to render");
} else {
    _entriesTextbox ctrlSetTextColor [0,0,0,1];
    _entriesTextbox ctrlSetStructuredText _entryText;
}
