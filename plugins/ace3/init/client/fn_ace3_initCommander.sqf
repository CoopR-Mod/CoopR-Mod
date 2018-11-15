params ["_commander"];

[_commander, 0, ["ACE_MainActions"],
["reputation_action_1", localize "str.dpl.reputation.action.commander", "", {call X11_fnc_deliverAfterActionReport}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
