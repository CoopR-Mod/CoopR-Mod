#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_player"];

private _loginCondition = format ["!(_this getVariable ['%1', false])", KEY_PLAYER_LOGGEDIN];

_player setPos (getPos lobby);
_player addAction ["Register", {[player, clientOwner] remoteExec ["X11_fnc_registerPlayer", SERVER];}, [], 0.5, true, true, "", _loginCondition];
_player addAction ["Login", { [getPlayerUID player, clientOwner] remoteExec ["X11_fnc_playerLogin", SERVER];} , [], 0.5, true, true,"", _loginCondition];

[format ["player %1 spawned in lobby", getPlayerUID player], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
