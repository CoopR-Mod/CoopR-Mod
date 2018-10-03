
#include "..\constants.hpp"

removeAllActions player;
player setUnitLoadout EMPTY_LOADOUT;
player setPos (getPos lobby);

// to prevent lobby players from syncing
player setVariable [KEY_PLAYER_LOGGEDIN, false];

FLOG("player %1 spawned in lobby", getPlayerUID player);

[] spawn X11_fnc_showLoginDialog;
