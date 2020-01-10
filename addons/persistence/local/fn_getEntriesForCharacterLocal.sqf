#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns all entries for a given characterID
 *
 * Arguments:
 * _characterID <NUMBER> - ID of character
 *
 * Return Value:
 * _entries <ARRAY> - all found entries
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_characterID", -1]];

if (isServer) then {
    if (_characterID isEqualTo -1) exitWith { ERROR("_characterID was not defined") };
    DEBUG2("fetching recon entries for character %1 ", _characterID);
    private _reportID = (player getVariable [COOPR_CHAR_CHARACTER_ID, -1]) call coopr_fnc_getReportIdForCharacterLocal;

    if (_reportID isEqualTo -1) exitWith { DEBUG("report id was null - skip fetching"); []; };

    private _allEntries = format ["SELECT entry FROM recon_entries WHERE report_id = %1", _reportID];
    private _results = (_allEntries call coopr_fnc_extDB3sql);
    private _destructuredEntries = [];
    { _destructuredEntries pushBack (_x select 0)} forEach _results; // to keep intuitive array structures
    _destructuredEntries;
} else {
    SERVER_ONLY_ERROR(__FILE__);
};
