#include "script_component.hpp"
params ["_commander"];

// after action report action
private _aarActionCondition = { not ((_player getVariable ['coopr_character_active_task', []]) isEqualTo []) };
[_commander, 0, ["ACE_MainActions"],
["aar_action_1", localize "str.coopr.aar.action.commander", "", {call coopr_fnc_deliverAfterActionReport}, _aarActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

// request task action
private _requestActionCondition = { (_player getVariable ['coopr_character_active_task', []]) isEqualTo [] };
[_commander, 0, ["ACE_MainActions"],
["minor_task_action_1", localize "str.coopr.task.action.request", "", {call coopr_fnc_requestCooprTask}, _requestActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

DEBUG2("initialized %1 as commander (ACE3)", _commander);
