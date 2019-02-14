#include "script_component.hpp"

TSTART;

TEST("should return 100");
private _actual = 0;

_actual = [2, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TASSERT(_actual == 100);

_actual = [3, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TASSERT(_actual == 100);

_actual = [4, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TASSERT(_actual == 100);

TEND;
