#include "script_component.hpp"

if (isNil "COOPR_HQ_WEST" && isNil "COOPR_HQ_EAST") then {
    SETUPERROR("There has to be at least one HQ module placed");
    false;
} else {
    SLOG("Verification of setup modules successful");
    true; // all fine
}

