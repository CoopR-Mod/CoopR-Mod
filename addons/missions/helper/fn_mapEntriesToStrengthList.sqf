#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Map recon entries to a list of strength reports. This function will parse all recon entries and pick out the
 * individual reports of enemy units. Then mash it up into a CBA has and return it for further processing
 *
 * Arguments:
 * 0: _reconEntries <ARRAY> - All recon entries given by a unit/player
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_reconEntries", []]];

if (_reconEntries isEqualTo []) exitWith { ERROR("_reconEntries was not defined") };

if (isServer) then {
    INFO("map recon entries to strength list");
    private _hash = EMPTY_HASH;
    private _infantryStrengths = [];
    private _motorizedStrengths = [];
    private _armoredStrengths = [];

    {
        private _entry = _x;
        private _type = [_entry, COOPR_CHAR_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
        private _strength = [_entry, COOPR_CHAR_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
        private _behaviour = [_entry, COOPR_CHAR_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;

        switch (_type) do {
            case COOPR_MISSION_REPORT_TYPE_INFANTRY : { _infantryStrengths pushBack _strength };
            case COOPR_MISSION_REPORT_TYPE_MOTORIZED : { _motorizedStrengths pushBack _strength };
            case COOPR_MISSION_REPORT_TYPE_ARMORED : { _armoredStrengths pushBack _strength };
        };

    } forEach _reconEntries;

    [_hash, COOPR_MISSION_REPORT_TYPE_INFANTRY, _infantryStrengths] call CBA_fnc_hashSet;
    [_hash, COOPR_MISSION_REPORT_TYPE_MOTORIZED, _motorizedStrengths] call CBA_fnc_hashSet;
    [_hash, COOPR_MISSION_REPORT_TYPE_ARMORED, _armoredStrengths] call CBA_fnc_hashSet;

    _hash // return

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
