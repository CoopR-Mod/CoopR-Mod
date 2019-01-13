#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Creates a CoopR recon task that applied to the whole group of a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 * 1: _position <ARRAY> - position array where to recon the area
 *
 * Return Value:
 * Boolean - if task was created successfully
 *
 * Example:
 * [player, [1,2,3]] call coopr_fnc_createReconTask;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_unit", objNull],
        ["_position", []]
];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };
if (_position isEqualTo []) exitWith { ERROR("_position was []") };

[_unit, ["coopr_task_recon_1"], "CoopR_Task_Recon", _position, 1, 2, true] call BIS_fnc_taskCreate;
