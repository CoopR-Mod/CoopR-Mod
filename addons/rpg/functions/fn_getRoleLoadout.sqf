#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the loadout for a given role class as an array
 *
 * Arguments:
 * 0: _roleClass <STRING> - class name of role to get data from
 *
 * Public: No
 *
 * Scope: Global
 */
params ["_roleClass"];

private _roleLoadout = [_roleClass, "loadout"] call coopr_fnc_getRoleData;

parseSimpleArray _roleLoadout;
