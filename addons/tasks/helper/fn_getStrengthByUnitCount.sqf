#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Find the proper strength definition for a given unit type and count
 *
 * Arguments:
 * 0: _type <STRING> - The type of unit
 * 1: _count <NUMBER> - The amount of this type of unit
 *
 * Return Value:
 * _strengthDefinition <STRING>
 *
 * Example:
 * ["Man", 14] call coopr_fnc_getStrengthByUnitCount;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_count", -1]];

if (_count isEqualTo -1) exitWith { ERROR("_count was not defined") };

if (_count > COOPR_STRENGTH_TYPE_FIRETEAM_MIN && _count < COOPR_STRENGTH_TYPE_FIRETEAM_MAX) then { COOPR_STRENGTH_TYPE_FIRETEAM };
if (_count > COOPR_STRENGTH_TYPE_SQUAD_MIN && _count < COOPR_STRENGTH_TYPE_SQUAD_MAX) then { COOPR_STRENGTH_TYPE_SQUAD };
if (_count > COOPR_STRENGTH_TYPE_PLATOON_MIN && _count < COOPR_STRENGTH_TYPE_PLATOON_MAX) then { COOPR_STRENGTH_TYPE_PLATOON };
if (_count > COOPR_STRENGTH_TYPE_COMPANY_MIN && _count < COOPR_STRENGTH_TYPE_COMPANY_MAX) then { COOPR_STRENGTH_TYPE_COMPANY };
