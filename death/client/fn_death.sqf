#include "..\constants.hpp"

FLOG("player %1 has been killed in action", name player);
//TODO: reactivate logic with refactored death system
cutText ["You joined the ranks of the fallen", "BLACK OUT", 0.1];
player setVariable [KEY_STATE, STATE_WIA, true];
player setVariable [KEY_DEATH_TIMESTAMP, serverTime, true];
REP_DEATH_MULTIPLIER call X11_fnc_convertTempToReputation;



