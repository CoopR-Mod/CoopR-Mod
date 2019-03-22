#include "script_component.hpp"

params[["_entriesTextbox", objNull],
       ["_entries", []]];

if (_entriesTextbox isEqualTo objNull) exitWith { ERROR("_entriesTextbox was empty string") };
_entriesTextbox ctrlSetStructuredText (parseText ""); // clear textbox

DEBUG("updating recon report entries");
{
    DEBUG2("adding entry: %1", _x);
    private _type = [_x, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
    private _strength = [_x, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
    private _behaviour = [_x, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
    private _marker = [_x, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
    private _time = [_x, COOPR_KEY_RECON_ENTRY_TIME] call CBA_fnc_hashGet;
    private _markerPos = getMarkerPos _marker;

    private _entryText = format ["%1,%2,%3 pos%4,%5 at %6", _type, _strength, _behaviour, _markerPos select 0, _markerPos select 1, _time];
    _entriesTextbox ctrlSetStructuredText (composeText [_entryText, lineBreak]);

} forEach _entries;
