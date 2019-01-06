#include "script_component.hpp"

INFO2("player %1 has been killed in action", name player);
cutText ["You have been wounded in action", "BLACK OUT", 0.1];

// setting variables for wounded in action state
player setVariable [COOPR_KEY_STATE, COOPR_STATE_WIA, true];
player setVariable [COOPR_KEY_WOUNDED_TIMESTAMP, serverTime, true];
player setVariable [COOPR_KEY_POSITION, getPos COOPR_HQ_WEST, true];

COOPR_REP_WIA_MULTIPLIER_WEST call coopr_fnc_convertTempToReputation;



