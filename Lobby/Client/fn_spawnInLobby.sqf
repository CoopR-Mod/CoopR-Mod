#include "..\constants.hpp"

cutText ["", "BLACK OUT", 0.001];
removeAllActions player;
player setUnitLoadout EMPTY_LOADOUT;
player setPos (getPos lobby);

// to prevent lobby players from syncing
player setVariable [KEY_PLAYER_LOGGEDIN, false, true];

FLOG("player %1 spawned in lobby", getPlayerUID player);

