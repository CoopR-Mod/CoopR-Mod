#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Initialized the mission system with ALiVE
 *
 * Arguments:
 * 1: _missionItems <ARRAY> - mission items the action should be applied to
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

params [["_missionItems", []]];

if (_missionItems isEqualTo []) exitWith { ERROR("_missionItems was not defined") };

INFO("using ALiVE mission system");

COOPR_MISSIONS_ACTIVE = true;

[_missionItems] call coopr_fnc_initMissionItems;

