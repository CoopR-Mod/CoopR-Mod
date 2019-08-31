#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Converts all recon reports to a CoopR mission.

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
    DEBUG2("recon entries to be converted: %1", count _reconEntries);
    private _reportID = (player getVariable [COOPR_CHAR_CHARACTER_ID, -1]) call coopr_fnc_getReportIdForCharacterLocal;
    private _scannedStrengths = [_reportID] call coopr_fnc_getReconAreaActivity;

    {
        DEBUG("parsing recon reports");
        private _entry = _x;
        private _owner = [_entry, COOPR_RECON_ENTRY_OWNER] call CBA_fnc_hashGet;
        private _type = [_entry, COOPR_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
        private _strength = [_entry, COOPR_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
        private _behaviour = [_entry, COOPR_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
        private _serializedMarkers = [_entry, COOPR_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
        private _time = [_entry, COOPR_RECON_ENTRY_TIME] call CBA_fnc_hashGet;

        { deleteMarker (_x select 0) } forEach _serializedMarkers;

        private _strengthListForType = [_scannedStrengths, _type] call CBA_fnc_hashGet;
        private _entryAccuracy = 0;
        // reported type is accurate
        if (count _strengthListForType > 0) then {
            _entryAccuracy = _entryAccuracy + COOPR_ACCURACY_THRESHOLD;
        };
        private _accuracy = [_strength, _strengthListForType] call coopr_fnc_validateReportEntry;
        _entryAccuracy = _entryAccuracy + _accuracy; // add validation accuracy value

        if (_entryAccuracy > 50) then {
            private _newCooprMission = EMPTY_HASH;
            // remove element to shrink down strength list for upcoming validations
            _strengthListForType deleteAt (_strengthListForType find _strength);

            private _cooprMissionType = [_strength, _type, _behaviour] call coopr_fnc_determineMissionType;
            DEBUG2("evaluated mission type: %1", _cooprMissionType);
            DEBUG("building coopr mission hash");
            [_newCooprMission, COOPR_MISSION_TYPE, _cooprMissionType] call CBA_fnc_hashSet;
            [_newCooprMission, COOPR_MISSION_DESCRIPTION, ""] call CBA_fnc_hashSet; // inactive
            [_newCooprMission, COOPR_MISSION_REPORT_TIME, _time] call CBA_fnc_hashSet;
            [_newCooprMission, COOPR_MISSION_MARKER, _serializedMarkers] call CBA_fnc_hashSet;
            [_newCooprMission, COOPR_MISSION_ACCURACY, _entryAccuracy] call CBA_fnc_hashSet;
            [_newCooprMission, COOPR_MISSION_TARGET, [_type, _strength]] call CBA_fnc_hashSet;

           ["defined mission details:", _newCooprMission] call coopr_fnc_logHash;

            [_newCooprMission] call coopr_fnc_pushMissionQueue;
            DEBUG2("coopr mission created");
        } else {
            INFO("skipping convertion - recon report entry was not valid ");
        };

        // put cleared strength list back to strength hash
        [_scannedStrengths, _type, _strengthListForType] call CBA_fnc_hashSet;
    } forEach _reconEntries;

    private _missionTracker = _unit getVariable [COOPR_MISSION_TRACKER, []];
    if (_missionTracker isEqualTo []) then {
        ERROR("mission tracker could not be fetched")
    } else {

        private _infStrengths = [_scannedStrengths, COOPR_MISSION_REPORT_TYPE_INFANTRY] call CBA_fnc_hashGet;
        private _motorizedStrengths = [_scannedStrengths, COOPR_MISSION_REPORT_TYPE_MOTORIZED] call CBA_fnc_hashGet;
        private _armoredStrengths = [_scannedStrengths, COOPR_MISSION_REPORT_TYPE_ARMORED] call CBA_fnc_hashGet;

        if ((_infStrengths isEqualTo []) and (_motorizedStrengths isEqualTo []) and (_armoredStrengths isEqualTo [])) then {
            [_missionTracker, COOPR_MISSION_TRACKER_RECON_COMPLETE, true] call CBA_fnc_hashSet;
            _unit setVariable [COOPR_MISSION_TRACKER, _missionTracker];
            DEBUG("recon report has been completed");
        };
    };

} else {
    SERVER_ONLY_ERROR(__FILE__);
};
