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
    INFO("server routines initialized");
} else {
    SERVER_ONLY_ERROR;
}

