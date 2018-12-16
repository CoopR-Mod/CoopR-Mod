[player, 1, ["ACE_SelfActions"],
["init_action_0", localize "str.coopr.ace3.interaction.coopr", "", {}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["reputation_action_1", localize "str.coopr.core.action.rep", "", {player call coopr_fnc_showReputation;}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "init_action_0"],
["logout_action_1", "<t color='#ff0000'>Logout</t>", "", {[] spawn { call coopr_fnc_logout;};}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
