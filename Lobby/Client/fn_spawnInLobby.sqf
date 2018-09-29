#include "..\..\globals.hpp"
#include "..\constants.hpp"



player setUnitLoadout EMPTY_LOADOUT;
player setPos (getPos lobby);
//_player addAction ["Register", {[player, clientOwner] remoteExec ["X11_fnc_registerPlayer", SERVER];}, [], 0.5, true, true, "", _loginCondition];
//_player addAction ["Login", { [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];} , [], 0.5, true, true,"", _loginCondition];

// to prevent lobby players from syncing
player setVariable [KEY_PLAYER_LOGGEDIN, false];

[format ["player %1 spawned in lobby", getPlayerUID player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

[] spawn X11_fnc_showLoginDialog;
