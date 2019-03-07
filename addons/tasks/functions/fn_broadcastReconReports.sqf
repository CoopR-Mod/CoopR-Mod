#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will parse all recon reports of a group/unit (CoopR: RECONREP / ALiVE: SPOTREP) and broadcasts it to the HQ logic.
 * The HQ will then generate tasks out of the recon reports depending on many factors. Broadcasting does only work
 * through radio or by delivering the reports directly to the commander NPC.
 *
 * Arguments:
 * 0: _unit <OBJECT> - The unit from which the reports should be broadcasted. Needs to be a player
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call coopr_fnc_broadcastReconReports
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (not (isPlayer _unit)) exitWith { ERROR("_unit was not a player") };

if (isServer) then {
    private _broadcastedReports = 0;

    // parse ALiVE SpotReps as Recon Reports
    if (INTEGRATE_ALIVE) then {
        private _allSpotrepIDs = [alive_sys_spotrep_store] call CBA_fnc_hashKeys;
        {
            private _id = _x;
            private _spotrep = [alive_sys_spotrep_store, _id] call CBA_fnc_hashGet;
            private _reportingPlayerID = [_spotrep, "ALiVE_SYS_spotrep_player"] call CBA_fnc_hashGet;
            private _markername = [_spotrep, "ALiVE_SYS_spotrep_markername"] call CBA_fnc_hashGet;
            [_spotrep, "ALiVE_SYS_spotrep_markerposition", getMarkerPos _markername] call CBA_fnc_hashSet;

            if (_reportingPlayerID isEqualTo (getPlayerUID _unit)) then {
                DEBUG("found spotrep by given unit");
                COOPR_RECON_REPORTS pushBack _spotrep;

                // clear spotrep store to prevent multipls
                [alive_sys_spotrep, "removespotrep", [_id]] call alive_fnc_spotrep;
                deleteMarker _markername;
                INFO2("broadcasting spotrep %1", _id);
                _broadcastedReports = _broadcastedReports + 1;
            } else {
                DEBUG("no spotrep found for given unit");
            };

       } forEach _allSpotrepIDs;

       // info message to player
       if (_broadcastedReports > 0) then {
           systemChat format ["||CoopR|| you broadcasted %1 recon reports", _broadcastedReports];
           call coopr_fnc_convertReconReportsToTasks;
           [_unit] call coopr_fnc_completeReconSubtask;
       } else {
           systemChat "||CoopR|| no recon reports have been created yet";
       };
    };
} else {
    SERVER_ONLY_ERROR;
};
