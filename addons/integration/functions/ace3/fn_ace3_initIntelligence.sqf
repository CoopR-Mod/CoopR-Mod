params ["_intelligence"];

[_intelligence, 0, ["ACE_MainActions"],
["intel_action_1", localize "str.coopr.intel.action.deliver", "", {call coopr_fnc_deliverIntel}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
