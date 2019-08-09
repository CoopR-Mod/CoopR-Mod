#include "script_component.hpp"

TSTART;
private _actual;

TEST("should return a sniper team mission");

_actual = [COOPR_STRENGTH_TYPE_FIRETEAM, COOPR_MISSION_REPORT_TYPE_INFANTRY, COOPR_MISSION_BEHAVIOUR_STATIC] call coopr_fnc_determineMissionType;
TEXPECT(COOPR_MISSION_TYPE_SNIPERTEAM, _actual);

_actual = [COOPR_STRENGTH_TYPE_FIRETEAM, COOPR_MISSION_REPORT_TYPE_INFANTRY, COOPR_MISSION_BEHAVIOUR_PATROL] call coopr_fnc_determineMissionType;
TEXPECT(COOPR_MISSION_TYPE_SNIPERTEAM, _actual);

TEST("should return an asymmetric mission");
_actual = [COOPR_STRENGTH_TYPE_SQUAD, COOPR_MISSION_REPORT_TYPE_INFANTRY, COOPR_MISSION_BEHAVIOUR_PATROL] call coopr_fnc_determineMissionType;
TEXPECT(COOPR_MISSION_TYPE_ASYMMETRIC, _actual);

TEST("should return an assault mission");

_actual = [COOPR_STRENGTH_TYPE_SQUAD, COOPR_MISSION_REPORT_TYPE_INFANTRY, COOPR_MISSION_BEHAVIOUR_STATIC] call coopr_fnc_determineMissionType;
TEXPECT(COOPR_MISSION_TYPE_ASSAULT, _actual);

TEND;
