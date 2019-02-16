#include "script_component.hpp"

TSTART;
private _actual;

TEST("should return a sniper team task");

_actual = [COOPR_STRENGTH_TYPE_FIRETEAM, COOPR_TASK_REPORT_TYPE_INFANTRY, COOPR_TASK_BEHAVIOUR_STATIC] call coopr_fnc_determineTaskType;
TEXPECT(COOPR_TASK_TYPE_SNIPERTEAM, _actual);
_actual = [COOPR_STRENGTH_TYPE_FIRETEAM, COOPR_TASK_REPORT_TYPE_INFANTRY, COOPR_TASK_BEHAVIOUR_PATROLING] call coopr_fnc_determineTaskType;
TEXPECT(COOPR_TASK_TYPE_SNIPERTEAM, _actual);

TEND;
