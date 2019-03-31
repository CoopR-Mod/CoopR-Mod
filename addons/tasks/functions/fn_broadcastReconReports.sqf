#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will parse all recon reports of a group/unit (RECONREP) and broadcasts it to the HQ logic.
 * The HQ will then generate tasks out of the recon reports depending on many factors. Broadcasting does only work
 * through radio or by delivering the reports directly to the commander NPC. The recon task requirement will be fulfilled
 * if a recon report is delivered successfully
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
    private _reconEntries = _unit getVariable [COOPR_KEY_RECON_ENTRIES, []];
    if (_reconEntries isEqualTo []) then {
        INFO("no recon entries created to broadcast");
    } else {
        // info message to player
        if ((count _reconEntries) > 0) then {
           private _reportInfo = format ["Reports send: %1", count _reconEntries];
           [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], [_reportInfo]] call CBA_fnc_notify;
           //call coopr_fnc_removeRedundantReports; TODO: remove?
           [_reconEntries] call coopr_fnc_convertReconReportsToTasks;
           [_unit] call coopr_fnc_completeReconSubtask;
           _unit setVariable [COOPR_KEY_RECON_ENTRIES, []];
        } else {
           [[COOPR_LOGO_SMALL], ["Recon Reports:", 1.3, COOPR_BRAND_COLOR], ["No recon reports created"]] call CBA_fnc_notify;
        };

    };
} else {
    SERVER_ONLY_ERROR;
};
