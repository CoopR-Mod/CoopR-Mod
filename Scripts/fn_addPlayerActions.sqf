#include "..\globals.hpp"

private _loginCondition = format ["!(_this getVariable ['%1', false])", KEY_PLAYER_LOGGEDIN];

player addAction ["Show reputation", { player call X11_fnc_showReputation; } , [], 0.5];
player addAction ["Show intel progress", { [player, clientOwner] remoteExec ["X11_fnc_showIntelProgress", 2]; } , [], 0.5];
player addAction ["Login", { [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", 2];} , [], 0.5, true, true,"", _loginCondition];

["player actions added", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

