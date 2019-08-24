#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Redraws saves markers for a character back to the map
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

private _characterID = player getVariable [COOPR_CHAR_CHARACTER_ID, -1];

[[_characterID], "coopr_fnc_getEntriesForCharacter", [], {
    params ["_callbackArgs", "_promisedResult"];
    private _reconEntries = _promisedResult;

    DEBUG2("redrawing markers for entries: %1", _reconEntries);
    {
      private _entry = _x;
      private _serializedMarkers = [_entry, COOPR_CHAR_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
      { [_x] call coopr_fnc_deserializeMarker } forEach _serializedMarkers;
    } forEach _reconEntries;

}] call coopr_fnc_promise;
