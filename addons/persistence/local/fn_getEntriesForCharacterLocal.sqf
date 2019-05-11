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
    INFO2("fetching recon entries for character %1 ", _characterID);
    private _reportID = (player getVariable [COOPR_KEY_CHARACTER_ID, -1]) call coopr_fnc_getReportIdForCharacter;
    private _allEntries = format ["SELECT entry FROM recon_entries WHERE report_id = %1", _reportID];
    (_allEntries call coopr_fnc_extDB3sql);
} else {
    SERVER_ONLY_ERROR;
};
