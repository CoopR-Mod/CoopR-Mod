#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This function will check the amount of counted/checked units and checks if it will fit into the range of a unit
 * strength type (like Fireteam or Squad). This function will return three different NUMBER values.
 *
 * Arguments:
 * 0: _amount <NUMBER> - The amount of units
 * 1: _strengthType <STRING> - A type to check for (Fireteam, Squad, etc.)
 *
 * Return Value:
 * 100: If the amount matches exactly the strength type
 *
 * Example:
 * [3, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy; // returns 100
 * [20, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy; // returns 60
 * [10, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy; // returns 100
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_amount", -1],
        ["_strengthType", ""]];

if (_amount isEqualTo -1) exitWith { ERROR("_amount was locationNull") };
if (_strengthType isEqualTo "") exitWith { ERROR("_strengthType was empty string") };

if (isServer) then {
    private _accuracy = 100;

    switch (_strengthType) do {
        case COOPR_STRENGTH_TYPE_FIRETEAM: {
            if(_amount >= COOPR_STRENGTH_TYPE_FIRETEAM_MIN and _amount <= COOPR_STRENGTH_TYPE_FIRETEAM_MAX) exitWith { 100 }
        };
        default { _checkRadius = 0 };
    };


} else {
    ERROR("this function is only allowed on the server side");
}
