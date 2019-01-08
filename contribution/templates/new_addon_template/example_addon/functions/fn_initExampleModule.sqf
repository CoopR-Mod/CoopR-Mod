#include "script_component.hpp"
/*
 * Author: HelpfulContributor
 *
 * Doing stuff with a given synced object
 *
 * Arguments:
 * 0: _syncedObject <OBJECT> - a synced objects
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 *
 * Scope: Server
 */
params [["_syncedObjects", objNull]];

DEBUG2("synced object is %1", _syncedObject);

INFO(FOO); // defined in script_component
INFO(BAR); // defined in script_component
