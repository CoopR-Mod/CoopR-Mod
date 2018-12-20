#include "script_component.hpp"

if (INTEGRATE_ACE3) then {
    call coopr_fnc_ace3_addPlayerActions;
} else {
    DEBUG("adding reputation action");
    player addAction [localize "str.coopr.core.action.rep", { player call coopr_fnc_showReputation; } , [], 0.5, true, true, "", "true"];
    // player addAction [localize "str.coopr.core.action.intelligence", { [player, clientOwner] remoteExec ["coopr_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", "true"];
    DEBUG("adding logout action");
    player addAction ["<t color='#ff0000'>Logout</t>", {[] spawn { call coopr_fnc_logout; };} , [], 0.5, true, true, "", "true"];
};

INFO("player actions added");
