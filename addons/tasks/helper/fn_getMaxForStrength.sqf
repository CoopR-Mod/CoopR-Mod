#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This helper function will get the max strength for a given strength unit type
 *
 * Arguments:
 * 0: _strengthType <STRING> - A type to check for (Fireteam, Squad, etc.)
 *
 * Return Value:
 * _maxValue <NUMBER>
 *
 * Example:
 * COOPR_STRENGTH_TYPE_FIRETEAM call coopr_fnc_getMaxForStrength;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_strengthType", ""]];

if (_strengthType isEqualTo "") exitWith { ERROR("_strengthType was empty string") };

private _maxValue = -1;

switch (_strengthType) do {
    case COOPR_STRENGTH_TYPE_FIRETEAM: { COOPR_STRENGTH_TYPE_FIRETEAM_MAX };
    case COOPR_STRENGTH_TYPE_SQUAD: { COOPR_STRENGTH_TYPE_SQUAD_MAX };
    case COOPR_STRENGTH_TYPE_PLATOON: { COOPR_STRENGTH_TYPE_PLATOON_MAX };
    case COOPR_STRENGTH_TYPE_COMPANY: { COOPR_STRENGTH_TYPE_COMPANY_MAX };
    default { -1 };
};
