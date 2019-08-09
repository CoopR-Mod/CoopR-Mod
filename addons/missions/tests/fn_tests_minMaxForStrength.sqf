#include "script_component.hpp"

TSTART;

private _max = 0;
private _min = 0;

TEST("should return correct max and min for fireteams");

_max = COOPR_STRENGTH_TYPE_FIRETEAM call coopr_fnc_getMaxForStrength;
TEXPECT(4, _max);
_min = COOPR_STRENGTH_TYPE_FIRETEAM call coopr_fnc_getMinForStrength;
TEXPECT(1, _min);

TEST("should return correct max and min for squads");

_max = COOPR_STRENGTH_TYPE_SQUAD call coopr_fnc_getMaxForStrength;
TEXPECT(14, _max);
_min = COOPR_STRENGTH_TYPE_SQUAD call coopr_fnc_getMinForStrength;
TEXPECT(8, _min);

TEST("should return correct max and min for platoons");

_max = COOPR_STRENGTH_TYPE_PLATOON call coopr_fnc_getMaxForStrength;
TEXPECT(45, _max);
_min = COOPR_STRENGTH_TYPE_PLATOON call coopr_fnc_getMinForStrength;
TEXPECT(15, _min);

TEST("should return correct max and min for companies");

_max = COOPR_STRENGTH_TYPE_COMPANY call coopr_fnc_getMaxForStrength;
TEXPECT(150, _max);
_min = COOPR_STRENGTH_TYPE_COMPANY call coopr_fnc_getMinForStrength;
TEXPECT(80, _min);

TEND;
