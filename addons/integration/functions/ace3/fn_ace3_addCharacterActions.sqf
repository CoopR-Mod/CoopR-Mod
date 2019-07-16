#include "script_component.hpp"

private _finishReportCondition = { player getVariable [COOPR_KEY_IN_RECON, false] };
private _reconReportActionCondition = { [player] call coopr_fnc_hasActiveTask and (player getVariable [COOPR_KEY_IN_RECON, false]) };

[player, 1, ["ACE_SelfActions"],
["init_action_0", localize "str.coopr.ace3.interaction.coopr", "", {}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
 ["finish_report_action_1", localize "str.coopr.core.action.finishreport", "", { [player] remoteExec ["coopr_fnc_finishReconReport", EXEC_SERVER] }, _finishReportCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["recon_report_action_1", localize "str.coopr.core.action.reports", "", {player call coopr_fnc_showReconReportDialog;}, _broadcastActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["reputation_action_1", localize "str.coopr.core.action.rep", "", {player call coopr_fnc_showReputation;}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["logout_action_1", "<t color='#ff0000'>Logout</t>", "", {[] spawn { call coopr_fnc_logout;};}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
