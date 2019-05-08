#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Helper to extract the boolean mashup for checking if a player/squad is within the task area marker
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

params [["_player", objNull]];

if (_player isEqualTo objNull) exitWith { ERROR("_player was objNull"); };

private _currentTask = player getVariable [COOPR_KEY_ACTIVE_TASK, []];
private _taskAreaMarker = _currentTask + "_task_marker";
DEBUG2("checking is in task area for %1", _taskAreaMarker);
getPos player inArea _taskAreaMarker;

