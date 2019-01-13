#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will run some routines against the local database. Like updating specific player states
 * for instance the wounded in action status that runs on a cooldown. When connected to the CoopR HQ database
 * all these routines will run on the webservice. For a local database this functions is doing the job
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call coopr_fnc_localDatabaseRefresh
 *
 * Public: No
 *
 * Scope: Server
 */

call coopr_fnc_checkCharacterWIAStates;

