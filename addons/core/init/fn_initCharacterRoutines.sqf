#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Orchestrating function for player character specific routines
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

[coopr_fnc_taskRoutine, COOPR_TIMER_TASK_ROUTINE, []] call CBA_fnc_addPerFrameHandler;

INFO("character routines initialized");
