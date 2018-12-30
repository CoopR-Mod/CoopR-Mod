#include "script_component.hpp"
params ["_intelligence"];

[_intelligence, 0, ["ACE_MainActions"],
["intel_action_1", localize "str.coopr.intelligence.action.deliver", "", {call coopr_fnc_deliverIntel}, {true}] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;
DEBUG2("initialized %1 as intelligence (ACE3)", _intelligence);
