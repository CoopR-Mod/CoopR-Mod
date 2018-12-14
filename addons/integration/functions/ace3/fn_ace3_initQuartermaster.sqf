params ["_quartermaster"];

//TODO: rename equipment vendor shop to quartermaster
[_quartermaster, 0, ["ACE_MainActions"],
["quartermaster_action_1", localize "str.coopr.equipment.action.quartermaster", "", {call coopr_fnc_showQuartermasterMenu}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
