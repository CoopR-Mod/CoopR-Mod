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

if (COOPR_MISSIONS_ACTIVE) then {
    [coopr_fnc_missionRoutine, COOPR_TIMER_MISSION_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
    [coopr_fnc_reconRoutine, COOPR_TIMER_RECON_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
    [coopr_fnc_desertionRoutine, COOPR_TIMER_DESERTION_ROUTINE, []] call CBA_fnc_addPerFrameHandler;
};
INFO("character routines initialized");
