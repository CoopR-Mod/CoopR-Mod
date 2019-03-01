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

[coopr_fnc_headquarterRoutine, COOPR_TIMER_HQ_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
[coopr_fnc_travelRoutine, COOPR_TIMER_TRAVEL_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
[coopr_fnc_missionRoutine, COOPR_TIMER_MISSION_ROUTINE, []] call CBA_fnc_addPerFrameHandler;

INFO("character routines initialized");
