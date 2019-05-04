#include "script_component.hpp"
params ["_commander"];

// after action report action
private _aarActionCondition = { _player call coopr_fnc_hasActiveTask };
[_commander, 0, ["ACE_MainActions"],
["aar_action_1", localize "str.coopr.aar.action.commander", "", {call coopr_fnc_deliverAfterActionReport}, _aarActionCondition] call ace_interact_menu_fnc_createAction
] call ace_interact_menu_fnc_addActionToObject;

DEBUG2("initialized %1 as commander (ACE3)", _commander);
