#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check if the player is going in desertion for instance leaving the headquarters without a task
 * or leaving the task area way to far
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

private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
if !(_isLoggedIn) exitWith { DEBUG("skipping desertion routine - not logged in"); };

if !([player] call coopr_fnc_isInHeadquarter) then {
    if !([player] call coopr_fnc_hasActiveTask) then {
        DEBUG("desertion routine running");
        DEBUG("player leaving headquarter without active task. desertion detected");
        [] spawn {sleep 3; player setPos getPos COOPR_HQ_WEST; }
    };
};
