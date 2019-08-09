#include "script_component.hpp"
/*
 * Author: xetra11 
 *
 * Initialized the mission items for the mission module. These items will receive an action
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

DEBUG2("initializing %1 as mission items", _missionItems);
{
    private _document = missionNamespace getVariable [_x, objNull];
    _missionboardActionCondition = { !([player] call coopr_fnc_hasActiveMission) };
    if (_document isEqualTo objNull) exitWith { ERROR("given document string could not be found as object")};
    _document addAction [localize "str.coopr.mission.action.openmissionboard", { call coopr_fnc_showMissionBoardDialog}, [], 1.5,true,true,"", _missionboardActionCondition call coopr_fnc_codeAsString ];
} forEach _missionItems;

