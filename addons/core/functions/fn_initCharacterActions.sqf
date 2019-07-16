#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will initialize all actions that come with CoopR for this character
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */


if (INTEGRATE_ACE3) then {
    call coopr_fnc_ace3_addCharacterActions;
} else {
    private _finishReportCondition = { player getVariable [COOPR_KEY_IN_RECON, false] };
    private _reconReportActionCondition = { [player] call coopr_fnc_hasActiveTask and (player getVariable [COOPR_KEY_IN_RECON, false])};
    private _buildCampsiteCondition = {[COOPR_CAMP_ITEM_AREA] call coopr_fnc_canBuildCampsiteStructure };
    private _buildTentCondition = {[COOPR_CAMP_ITEM_TENT] call coopr_fnc_canBuildCampsiteStructure };

    player addAction [localize "str.coopr.core.action.rep", { player call coopr_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
    player addAction [localize "str.coopr.core.action.reports", { call coopr_fnc_showReconReportDialog; } , [], 0.5, true, true, "", _reconReportActionCondition call coopr_fnc_codeAsString];
    player addAction [localize "str.coopr.core.action.finishreport", { [player] remoteExec ["coopr_fnc_finishReconReport", EXEC_SERVER] } , [], 0.5, true, true, "", _finishReportCondition call coopr_fnc_codeAsString];
    player addAction [localize "str.coopr.campsite.action.startcampsite", {[COOPR_CAMP_ITEM_AREA] call coopr_fnc_buildCampsiteStructure; }, [], -1, true, true, "", _buildCampsiteCondition call coopr_fnc_codeAsString];
    player addAction ["TENT", {[COOPR_CAMP_ITEM_TENT] call coopr_fnc_buildCampsiteStructure; }, [], -1, true, true, "", _buildTentCondition call coopr_fnc_codeAsString]; 
    
    player addAction ["<t color='#ff0000'>Logout</t>", {[] spawn { call coopr_fnc_logout; };} , [], 0.5, true, true, "", "true"];
    if (COOPR_DEV_MODE) then {
        player addAction ["<t color='#F633FF'>-DEV- HQ</t>", {} , [], 0.5, true, true, "", "true"];
        player addAction ["<t color='#F633FF'>Teleport HQ</t>", {player setPos (getPos COOPR_HQ_WEST)} , [], 0.5, true, true, "", "true"];
    }
};

INFO("player actions added");
