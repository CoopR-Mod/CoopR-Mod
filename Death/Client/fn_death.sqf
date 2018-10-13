#include "..\constants.hpp"

player setVariable [KEY_STATE, STATE_KIA];
player setVariable [KEY_DEATH_TIMESTAMP, serverTime];
cutText ["You joined the ranks of the fallen", "BLACK OUT", 0.1];
sleep 4;

