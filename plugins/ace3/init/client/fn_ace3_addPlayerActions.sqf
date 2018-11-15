[player, 1, ["ACE_SelfActions"],
["reputation_action_0", localize "str.dpl.reputation.mychar", "", {}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "reputation_action_0"],
["init_action_1", localize "str.dpl.init.action.rep", "", {player call X11_fnc_showReputation;}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

[player, 1, ["ACE_SelfActions", "reputation_action_0"],
["logout_action_1", "<t color='#ff0000'>Logout</t>", "", {[] spawn { call X11_fnc_logout;};}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
