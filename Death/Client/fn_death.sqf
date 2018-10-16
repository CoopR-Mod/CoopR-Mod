#include "..\constants.hpp"

FLOG("player %1 has been killed in action", name player);
player setVariable [KEY_STATE, STATE_KIA, true];
player setVariable [KEY_DEATH_TIMESTAMP, serverTime, true];
cutText ["You joined the ranks of the fallen", "BLACK OUT", 0.1];

