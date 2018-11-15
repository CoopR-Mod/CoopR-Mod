#include "..\constants.hpp"

if (isClass (configfile >> "CfgPatches" >> "ace_common")) then {
  [player, 1, ["ACE_SelfActions"],
    ["reputation_action_0", localize "str.dpl.reputation.mychar", "", {}, {true}] call ace_interact_menu_fnc_createAction
  ] call ace_interact_menu_fnc_addActionToObject;

  [player, 1, ["ACE_SelfActions", "reputation_action_0"],
    ["init_action_1", localize "str.dpl.init.action.rep", "", {player call X11_fnc_showReputation;}, {true}] call ace_interact_menu_fnc_createAction
  ] call ace_interact_menu_fnc_addActionToObject;

	[player, 1, ["ACE_SelfActions", "reputation_action_0"],
		["logout_action_1", "<t color='#ff0000'>Logout</t>", "", {call X11_fnc_logout;}, {true}] call ace_interact_menu_fnc_createAction
	] call ace_interact_menu_fnc_addActionToObject;
} else {
	player addAction [localize "str.dpl.init.action.rep", { player call X11_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
	// player addAction [localize "str.dpl.init.action.intel", { [player, clientOwner] remoteExec ["X11_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", "true"];
	player addAction ["<t color='#ff0000'>Logout</t>", {call X11_fnc_logout;} , [], 0.5, true, true, "", "true"];
};

SLOG("player actions added");
