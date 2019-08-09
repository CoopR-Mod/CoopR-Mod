#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This routine will check all parameters regarding missions
 * Routine timer: COOPR_TIMER_MISSION_ROUTINE
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

private _isLoggedIn = player getVariable [COOPR_KEY_PLAYER_LOGGEDIN, false];
if !(_isLoggedIn) exitWith { DEBUG("skipping mission routine - not logged in"); };

if ([player] call coopr_fnc_hasActiveMission) then {
    //DEBUG("mission routine running");
    private _missionTracker = player getVariable [COOPR_KEY_MISSION_TRACKER, EMPTY_HASH];
    //DEBUG2("missiontracker state: %1", _missionTracker);
    if ([player] call coopr_fnc_isInMissionArea) then {
        private _timeStamp = call coopr_fnc_currentGameTime;
        [_missionTracker, COOPR_KEY_MISSION_TRACKER_VISITED_MISSION_AREA, true] call CBA_fnc_hashSet;
        player setVariable [COOPR_KEY_MISSION_TRACKER, _missionTracker, true];
    }
};
