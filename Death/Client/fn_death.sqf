#include "..\constants.hpp"

FLOG("player %1 has been killed in action", name player);
//TODO: reactivate logic with refactored death system
player setVariable [KEY_POSITION, getPos respawn_hq, true];
//player setVariable [KEY_STATE, STATE_KIA, true];
//player setVariable [KEY_DEATH_TIMESTAMP, serverTime, true];

cutText ["You joined the ranks of the fallen", "BLACK OUT", 0.1];

