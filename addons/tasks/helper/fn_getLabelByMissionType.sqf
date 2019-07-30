#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Returns the human readable naming of a mission type
 *
 * Arguments:
 * 0: _missionType <STRING> - type of mission
 *
 * Return Value:
 * _missionLabel <STRING>
 *
 * Example:
 * COOPR_TASK_TYPE_SNIPERTEAM call coopr_fnc_getLabelByMissionType;
 *
 * Public: No
 *
 * Scope: Global
 */

params [["_missionType", ""]];

if (_missionType isEqualTo "") exitWith { ERROR("_missionType was empty string") };

switch (_missionType) do {
	case COOPR_TASK_TYPE_SNIPERTEAM: { localize "str_coopr_task_type_sniperteam" };
	case COOPR_TASK_TYPE_ASYMMETRIC: { localize "str_coopr_task_type_asymmetric" };
	case COOPR_TASK_TYPE_ASSAULT: { localize "str_coopr_task_type_assault" };
	case COOPR_TASK_TYPE_CONQUER: { localize "str_coopr_task_type_conquer" };
	case COOPR_TASK_TYPE_JTAC: { localize "str_coopr_task_type_jtac" };
	case COOPR_TASK_TYPE_AMBUSH: { localize "str_coopr_task_type_ambush" };
	default { };
}; 