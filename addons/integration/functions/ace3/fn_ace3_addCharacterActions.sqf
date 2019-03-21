#include "script_component.hpp"

_broadcastActionCondition = { count ([alive_sys_spotrep_store] call CBA_fnc_hashKeys) > 0 };
_reconReportActionCondition = { [player] call coopr_fnc_hasActiveTask };

[player, 1, ["ACE_SelfActions"],
["init_action_0", localize "str.coopr.ace3.interaction.coopr", "", {}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["broadcast_action_1", localize "str.coopr.core.action.broadcast", "", {player call coopr_fnc_broadcastReconReports;}, _broadcastActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["recon_report_action_1", localize "str.coopr.core.action.reports", "", {player call coopr_fnc_initReconRepDialog;}, _broadcastActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["reputation_action_1", localize "str.coopr.core.action.rep", "", {player call coopr_fnc_showReputation;}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["logout_action_1", "<t color='#ff0000'>Logout</t>", "", {[] spawn { call coopr_fnc_logout;};}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
