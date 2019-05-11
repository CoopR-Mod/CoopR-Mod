#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * This function will do some clean up tasks after a character logs out. Like removing player placed markers etc.
 * This is important due the fact the player can login with three different characters and they all should have their
 * unique state as good as possible.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Client
 */

private _characterID = player getVariable [COOPR_KEY_CHARACTER_ID, -1];
INFO2("running clean up for character %1", _characterID);

//TODO: into own function
INFO("removing characters markers");
private _userMarkers = allMapMarkers select { _x find "_USER_DEFINED"};
DEBUG2("found %1 user markers", _userMarkers);
{ deleteMarkerLocal _userMarkers } forEach _userMarkers;

private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
if !(_currentTask isEqualTo []) then {
    [(_currentTask call coopr_fnc_serializeTask)] remoteExec ["coopr_fnc_saveTask", EXEC_SERVER];
    [_currentTask] spawn coopr_fnc_removeTaskMarker;
};
