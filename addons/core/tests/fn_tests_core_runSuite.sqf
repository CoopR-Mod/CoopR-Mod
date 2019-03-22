#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function just runs all tests of this context
 */

if (COOPR_DEV_MODE) then {
    [] spawn {
        //call coopr_fnc_tests_reputation;
        call coopr_fnc_tests_markerSerialization;
    };
}
