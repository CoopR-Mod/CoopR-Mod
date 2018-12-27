#include "script_component.hpp"

if (isNil "COOPR_HQ_WEST" && isNil "COOPR_HQ_EAST") exitWith {
    SETUPERROR("There has to be at least one HQ module placed");
    false;
};
if (isNil "COOPR_LOBBY") exitWith {
    SETUPERROR("There has to be at least one lobby module placed");
    false;
};
INFO("Verification of setup modules successful");
true; // all fine
