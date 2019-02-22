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
        if (INTEGRATE_ALIVE) then {

            DEBUG("parsing spotrep reports");
            private _spotrep = _x;
            private _reportingPlayerID = [_spotrep, "ALiVE_SYS_spotrep_player"] call CBA_fnc_hashGet;
            private _strength = [_spotrep, "ALiVE_SYS_spotrep_size"] call CBA_fnc_hashGet;
            private _notes = [_spotrep, "ALiVE_SYS_spotrep_remarks"] call CBA_fnc_hashGet;
            private _location = [_spotrep, "ALiVE_SYS_spotrep_loc"] call CBA_fnc_hashGet;
            private _type = [_spotrep, "ALiVE_SYS_spotrep_type"] call CBA_fnc_hashGet;
            // will turn i.e. "Mechanized Infantry - Mechanized Company HQ" into "MechanizedInfantry"
            _type = [_type splitString ":" select 0, " ", ""] call coopr_fnc_stringReplace;
            private _behaviour = [_spotrep, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;
            private _markerPosition = [_spotrep, "ALiVE_SYS_spotrep_markerposition"] call CBA_fnc_hashGet;

            private _reportAccuracy = [_markerPosition, _strength, _type, _behaviour] call coopr_fnc_validateReport;
            DEBUG2("reportAccuracy %1", _reportAccuracy);
            private _cooprTaskType = [_strength, _type, _behaviour] call coopr_fnc_determineTaskType;
            DEBUG2("determined task type: %1", _cooprTaskType);

            if (_reportAccuracy >= COOPR_ACCURACY_THRESHOLD and !(_cooprTaskType isEqualTo COOPR_TASK_TYPE_NONE)) then {
                private _newCooprTask = EMPTY_HASH;

                DEBUG("building coopr task hash");
                [_newCooprTask, COOPR_KEY_TASK_TYPE, _cooprTaskType] call CBA_fnc_hashSet;
                [_newCooprTask, COOPR_KEY_TASK_UID, _reportingPlayerID] call CBA_fnc_hashSet;
                [_newCooprTask, COOPR_KEY_TASK_LOCATION, _markerPosition] call CBA_fnc_hashSet;
                [_newCooprTask, COOPR_KEY_TASK_DESCRIPTION, _notes] call CBA_fnc_hashSet;
                [_newCooprTask, COOPR_KEY_TASK_TARGET, _strength] call CBA_fnc_hashSet;

                DEBUG2("defined task details: %1", _newCooprTask);
                COOPR_TASKS_QUEUE pushBack _newCooprTask;
                _createdCounter = _createdCounter + 1;
            } else {
                DEBUG("no task was generated out of recon report");
                DEBUG2("accuracy of report was below %1", COOPR_ACCURACY_THRESHOLD);
            };
        };
    } forEach COOPR_RECON_REPORTS;

    DEBUG2("generated coopr tasks: %1", _createdCounter);
    DEBUG("clearing recon reports array");
    COOPR_RECON_REPORTS = [];
} else {
    SERVER_ONLY_ERROR;
};
