#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Orchestrating function for server specific routines
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 *
 * Scope: Server
 */

if (isServer) then {
    [coopr_fnc_taskFreshnessRoutine, COOPR_TIMER_TASK_FRESHNESS_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
    INFO("server routines initialized");
} else {
    SERVER_ONLY_ERROR;
}

