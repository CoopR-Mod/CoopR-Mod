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

if !([player] call coopr_fnc_isInHeadquarter) then {
    if !([player] call coopr_fnc_hasActiveTask) then {
        DEBUG("desertion routine running");
        DEBUG("player leaving headquarter without active task. desertion detected");
        [] spawn {sleep 3; player setPos getPos COOPR_HQ_WEST; }
    };
};
