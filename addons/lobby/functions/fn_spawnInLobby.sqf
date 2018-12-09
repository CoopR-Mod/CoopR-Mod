#include "script_component.hpp"

cutText ["", "BLACK OUT", 0.001];
player setUnitLoadout EMPTY_LOADOUT;
player setPos getPos COOPR_LOBBY;
// to prevent lobby players from syncing
player setVariable [KEY_PLAYER_LOGGEDIN, false, true];

//FLOG("player %1 spawned in lobby", getPlayerUID player);

