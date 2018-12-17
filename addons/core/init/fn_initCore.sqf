#include "script_component.hpp"

params [["_reputationMan", objNull],
        ["_WIAReputation", objNull],
        ["_logic", objNull]];

if (_reputationMan isEqualTo objNull) exitWith { SETUPERROR("There was no reputation per man (infantry) defined") };
if (_WIAReputation isEqualTo objNull) exitWith { SETUPERROR("There was no reputation multiplier for WIA defined") };

COOPR_REP_MAN = _reputationMan;
COOPR_REP_WIA_MULTIPLIER_WEST = _WIAReputation;
