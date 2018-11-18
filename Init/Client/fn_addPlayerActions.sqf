#include "..\constants.hpp"

if (call X11_fnc_isACE3Active) then {
    call X11_fnc_ace3_addPlayerActions;
} else {
	player addAction [localize "str.dpl.init.action.rep", { player call X11_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
	// player addAction [localize "str.dpl.init.action.intel", { [player, clientOwner] remoteExec ["X11_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", "true"];
	player addAction ["<t color='#ff0000'>Logout</t>", {[] spawn { call X11_fnc_logout; };} , [], 0.5, true, true, "", "true"];
};

SLOG("player actions added");
