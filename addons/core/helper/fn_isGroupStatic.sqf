#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Checks if a given group is static means not working on waypoints
 *
 * Arguments:
 * 0: _group <GROUP> - group to be checked
 *
 * Return Value:
 * Boolean - if the group is static or not
 *
 * Example:
 * Trivial
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_group", objNull]];

if (_group isEqualTo objNull) exitWith { ERROR("_group was objNull") };

if (isServer) then {
    private _waypointCount = count (waypoints _group);
    DEBUG2("wp count: %1", _waypointCount);
    private _currentWaypoint = currentWaypoint _group;
    DEBUG2("current wp: %1", _currentWaypoint);
    _currentWaypoint >= (_waypointCount - 0);
} else {
    SERVER_ONLY_ERROR;
};