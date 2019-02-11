#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Converts all recon reports to CoopR missions/tasks
 *
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
            private _behaviour = [_spotrep, "ALiVE_SYS_spotrep_activity"] call CBA_fnc_hashGet;

            private _cooprTask = EMPTY_HASH;
            private _cooprTaskType = nil;

            [_location, _strength, _type, _behaviour] call coopr_fnc_validateReport;

            DEBUG("defining task type");
            if (_type isEqualTo "Infantry") then {
                DEBUG("task defined for infantry combat");
                switch (_strength) do {
                   case "FireTeam": { _cooprTaskType = COOPR_TASK_TYPE_SNIPERTEAM };
                }
            };

            DEBUG("building coopr task hash");
            [_cooprTask, COOPR_KEY_TASK_TYPE, _cooprTaskType] call CBA_fnc_hashSet;
            [_cooprTask, COOPR_KEY_TASK_UID, _reportingPlayerID] call CBA_fnc_hashSet;
            [_cooprTask, COOPR_KEY_TASK_LOCATION, _location] call CBA_fnc_hashSet;
            [_cooprTask, COOPR_KEY_TASK_DESCRIPTION, _notes] call CBA_fnc_hashSet;

            DEBUG2("created task is: %1", _cooprTask);
            COOPR_TASKS pushBack _cooprTask;
            _createdCounter = _createdCounter + 1;
        };

    } forEach COOPR_RECON_REPORTS;

    DEBUG2("generated coopr tasks: %1", _createdCounter);
    DEBUG("clearing recon reports array");
    COOPR_RECON_REPORTS = [];
};
