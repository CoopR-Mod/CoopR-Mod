#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This helper function will get the min strength for a given strength unit type
 *
 * Arguments:
 * 0: _strengthType <STRING> - A type to check for (Fireteam, Squad, etc.)
 *
 * Return Value:
 * _minValue <NUMBER>
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

private _minValue = -1;

switch (_strengthType) do {
    case COOPR_STRENGTH_TYPE_FIRETEAM: { COOPR_STRENGTH_TYPE_FIRETEAM_MIN };
    case COOPR_STRENGTH_TYPE_SQUAD: { COOPR_STRENGTH_TYPE_SQUAD_MIN };
    case COOPR_STRENGTH_TYPE_PLATOON: { COOPR_STRENGTH_TYPE_PLATOON_MIN };
    case COOPR_STRENGTH_TYPE_COMPANY: { COOPR_STRENGTH_TYPE_COMPANY_MIN };
    default { -1 };
};
