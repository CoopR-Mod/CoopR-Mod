#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will do some clean up missions after a character logs out. Like removing player placed markers etc.
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


//TODO: into own function
INFO("removing characters markers");
//cutText ["cleaning up character state", "BLACK OUT", 0.0001];
private _userMarkers = allMapMarkers select { (_x find "_USER_DEFINED") == 0};
DEBUG2("removing %1 user markers", _userMarkers);
{ deleteMarkerLocal _x } forEach _userMarkers;

private _currentMission = player getVariable [COOPR_KEY_ACTIVE_MISSION, []];
if !(_currentMission isEqualTo []) then {
    [(_currentMission call coopr_fnc_serializeMission)] remoteExec ["coopr_fnc_saveMission", EXEC_SERVER];
    [_currentMission] spawn coopr_fnc_removeMissionMarker;
};
//cutText ["cleanup done", "BLACK OUT", 0.0001];
