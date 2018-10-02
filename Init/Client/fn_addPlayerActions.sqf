
#include "..\constants.hpp"

private _condition = format ["(_this getVariable ['%1', false])", KEY_PLAYER_LOGGEDIN];

player addAction [localize "str.dpl.action.rep", { player call X11_fnc_showReputation; } , [], 0.5, true, true, "", _condition];
player addAction [localize "str.dpl.action.intel", { [player, clientOwner] remoteExec ["X11_fnc_showIntelProgress", SERVER]; } , [], 0.5, true, true, "", _condition];

["player actions added", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

