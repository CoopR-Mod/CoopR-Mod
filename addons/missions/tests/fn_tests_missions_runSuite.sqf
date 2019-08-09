#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function just runs all tests of this context
 */

if (isServer) then {
    if (COOPR_DEV_MODE) then {
        [] spawn {
            call coopr_fnc_tests_strengthAccuracy;
            call coopr_fnc_tests_minMaxForStrength;
            //call coopr_fnc_tests_determineMissionType;
            //call coopr_fnc_tests_checkMissionTracking;
            //call coopr_fnc_tests_initMissionTracker;
        };
    }
}
