#include "script_component.hpp"

params [["_reputationMan", objNull],
        ["_WIAReputation", objNull],
        ["_logic", objNull]];

if (_reputationMan isEqualTo objNull) exitWith { SETUPERROR("There was no reputation per man (infantry) defined") };
if (_WIAReputation isEqualTo objNull) exitWith { SETUPERROR("There was no reputation multiplier for WIA defined") };

COOPR_REP_MAN = _reputationMan;
COOPR_REP_WIA_MULTIPLIER_WEST = _WIAReputation;
COOPR_TASKS_QUEUE = [];

publicVariable "COOPR_REP_MAN";
publicVariable "COOPR_REP_WIA_MULTIPLIER_WEST";
publicVariable "COOPR_RECON_REPORTS";
publicVariable "COOPR_TASKS_QUEUE";
