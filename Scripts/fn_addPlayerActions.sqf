#include "..\constants.hpp"

player addAction ["Show reputation", { [_this select 0, clientOwner] remoteExec ["X11_fnc_showReputation", 2]; } , [], 0.5];
player addAction ["Login", { [getPlayerUID player, clientOwner] remoteExec X11_fnc_playerLogin;} , [], 0.5, true, true,"", "_this getVariable [KEY_PLAYER_LOGGEDIN, 0]"];

["player actions added", DEBUG_STR_CLIENT_INIT, DEBUG_CFG] call CBA_fnc_debug;

