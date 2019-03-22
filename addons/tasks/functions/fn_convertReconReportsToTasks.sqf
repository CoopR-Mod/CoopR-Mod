#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Converts all recon reports to CoopR missions/tasks if the accuracy is above COOPR_ACCURACY_THRESHOLD

 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_convertReconReportsToTasks
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    DEBUG2("recon reports count: %1", count COOPR_RECON_REPORTS);

    private _createdCounter = 0;
    {
        DEBUG("parsing recon reports");
        private _entry = _x;
        private _type = [_entry, COOPR_KEY_RECON_ENTRY_TYPE] call CBA_fnc_hashGet;
        private _strength = [_entry, COOPR_KEY_RECON_ENTRY_STRENGTH] call CBA_fnc_hashGet;
        private _behaviour = [_entry, COOPR_KEY_RECON_ENTRY_BEHAVIOUR] call CBA_fnc_hashGet;
        private _marker = [_entry, COOPR_KEY_RECON_ENTRY_MARKER] call CBA_fnc_hashGet;
        private _time = [_entry, COOPR_KEY_RECON_ENTRY_TIME] call CBA_fnc_hashGet;
        private _markerPosition = getMarkerPos _marker;

        private _reportAccuracy = [_markerPosition, _strength, _type, _behaviour] call coopr_fnc_validateReport;
        DEBUG2("reportAccuracy %1", _reportAccuracy);
        private _cooprTaskType = [_strength, _type, _behaviour] call coopr_fnc_determineTaskType;
        DEBUG2("determined task type: %1", _cooprTaskType);

        if (_reportAccuracy >= COOPR_ACCURACY_THRESHOLD and !(_cooprTaskType isEqualTo COOPR_TASK_TYPE_NONE)) then {
            private _newCooprTask = EMPTY_HASH;

            DEBUG("building coopr task hash");
            [_newCooprTask, COOPR_KEY_TASK_TYPE, _cooprTaskType] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_LOCATION, _markerPosition] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_DESCRIPTION, _notes] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_REPORT_TIME, _time] call CBA_fnc_hashSet;
            [_newCooprTask, COOPR_KEY_TASK_MARKER, [_marker] call coopr_fnc_serializeMarker] call CBA_fnc_hashSet;

            DEBUG2("defined task details: %1", _newCooprTask);
            COOPR_TASKS_QUEUE pushBack _newCooprTask;
            _createdCounter = _createdCounter + 1;
            deleteMarker _marker; // clean up marker on map
        } else {
            DEBUG("no task was generated out of recon report");
            DEBUG2("accuracy of report was below %1", COOPR_ACCURACY_THRESHOLD);
        };
    } forEach COOPR_RECON_REPORTS;

    DEBUG2("generated coopr tasks: %1", _createdCounter);
    DEBUG("clearing recon reports array");
    COOPR_RECON_REPORTS = [];
} else {
    SERVER_ONLY_ERROR;
};
