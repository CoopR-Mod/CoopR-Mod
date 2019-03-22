#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function just runs all tests of this context
 */

//call coopr_fnc_tests_countTasks; TODO: still failing
if (COOPR_DEV_MODE) then {
    [] spawn {
        //call coopr_fnc_tests_strengthAccuracy;
        //call coopr_fnc_tests_minMaxForStrength;
        //call coopr_fnc_tests_determineTaskType;
        //call coopr_fnc_tests_checkTaskTracking;
        //call coopr_fnc_tests_initTaskTracker;
    };
}
