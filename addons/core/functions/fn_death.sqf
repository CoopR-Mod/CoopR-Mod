#include "script_component.hpp"

INFO2("player %1 has been killed in action", name player);
//TODO: reactivate logic with refactored death system
cutText ["You joined the ranks of the fallen", "BLACK OUT", 0.1];
player setVariable [COOPR_KEY_STATE, COOPR_STATE_WIA, true];
player setVariable [COOPR_KEY_DEATH_TIMESTAMP, serverTime, true];
COOPR_REP_WIA_MULTIPLIER_WEST call coopr_fnc_convertTempToReputation;



