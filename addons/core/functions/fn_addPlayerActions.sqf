#include "script_component.hpp"

if (call coopr_fnc_isACE3Active) then {
    call coopr_fnc_ace3_addPlayerActions;
} else {
	player addAction [localize "str.coopr.core.action.rep", { player call coopr_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
	// player addAction [localize "str.coopr.core.action.intel", { [player, clientOwner] remoteExec ["coopr_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", "true"];
	player addAction ["<t color='#ff0000'>Logout</t>", {[] spawn { call coopr_fnc_logout; };} , [], 0.5, true, true, "", "true"];
};

SLOG("player actions added");
