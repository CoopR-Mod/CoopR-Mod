#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will return the game time of for coopr. This is a time fetched from the CoopR HQ server and therefore
 * independent from any server restarts and whatsoever. If there is no connection to the CoopR HQ server then it will
 * simply return the serverTime
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * _currentGameTime <NUMBER> - the current gametime
 *
 * Example:
 * call coopr_fnc_currentGameTime;
 *
 * Public: No
 *
 * Scope: Global
 */

if (isNil "COOPR_PERSISTENCE_HQ_CONNECTION") then {
    serverTime;
} else {
    if (COOPR_PERSISTENCE_HQ_CONNECTION isEqualTo false) then {
        serverTime;
    } else {
        //TODO: remote call to fetch game time
    };
};

