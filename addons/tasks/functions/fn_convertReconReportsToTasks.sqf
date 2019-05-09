#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Converts all recon reports to CoopR missions/tasks.

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
    DEBUG2("recon reports to be converted: %1", count _reconEntries);

    private _createdCounter = 0;
    {
        DEBUG("parsing recon reports");
        private _entry = _x;
        private _type = [_entry, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
        private _strength = [_entry, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
        private _behaviour = [_entry, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
        private _marker = [_entry, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
        private _time = [_entry, COOPR_KEY_RECON_ENTRY_TIME] call CBA_fnc_hashGet;
        private _accuracy = [_entry, COOPR_KEY_RECON_ENTRY_ACCURACY] call CBA_fnc_hashGet;

        private _cooprTaskType = [_strength, _type, _behaviour] call coopr_fnc_determineTaskType;
        DEBUG2("determined task type: %1", _cooprTaskType);

        private _serializedMarker = [];
        { _serializedMarker pushBack ([_x, true] call coopr_fnc_serializeMarker); } forEach _marker;

        private _newCooprTask = EMPTY_HASH;

        if (_accuracy >= 0) then {
            DEBUG("building coopr task hash");
            [_newCooprTask, COOPR_KEY_TASK_TYPE, _cooprTaskType] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_DESCRIPTION, ""] call CBA_fnc_hashSet; // inactive
            [_newCooprTask, COOPR_KEY_TASK_REPORT_TIME, _time] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_MARKER, _serializedMarker] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_ACCURACY, _accuracy] call CBA_fnc_hashSet;

            DEBUG2("defined task details: %1", _newCooprTask);
            [_newCooprTask] call coopr_fnc_pushTaskQueue;
            _createdCounter = _createdCounter + 1;
        } else {
            INFO("skipping convertion - recon report has accuracy -1");
        }
    } forEach _reconEntries;

    DEBUG2("generated coopr tasks: %1", _createdCounter);
} else {
    SERVER_ONLY_ERROR;
};
