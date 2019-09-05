#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check if the player is going in desertion for instance leaving the headquarters without a mission
 * or leaving the mission area way to far
 * Routine timer: COOPR_TIMER_DESERTION_ROUTINE
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Client
 */

private _isLoggedIn = player getVariable [COOPR_CHAR_PLAYER_LOGGEDIN, false];
if !(_isLoggedIn) exitWith { DEBUG("skipping desertion routine - not logged in"); };

if !([player] call coopr_fnc_isInHeadquarter) then {
    if !([player] call coopr_fnc_hasActiveMission) then {
        DEBUG("desertion routine running");
        DEBUG("player leaving headquarter without active mission. desertion detected");
        [] spawn {sleep 3; player setPos getPos COOPR_HQ_WEST; }
    };
};
