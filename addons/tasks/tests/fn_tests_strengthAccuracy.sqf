#include "script_component.hpp"

TSTART;

private _actual = 0;

TEST("should return 100 for fireteam size 1-4");

_actual = [1, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [2, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [3, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [4, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);

TEST("should return decreased accuracy for every offset for fireteam size 1-4");

_actual = [5, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(75, _actual);
_actual = [6, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(50, _actual);
_actual = [7, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(25, _actual);
_actual = [8, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(0, _actual);
_actual = [9, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(0, _actual);
_actual = [10, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(0, _actual);
_actual = [0, COOPR_STRENGTH_TYPE_FIRETEAM] call coopr_fnc_strengthAccuracy;
TEXPECT(0, _actual);

TEST("should return 100 for squad size 8-14");

_actual = [8, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [9, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [10, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [11, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [12, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [13, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [14, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);

TEST("should return decreased accuracy for every offset for squad size 8-14");

_actual = [4, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(50, _actual);
_actual = [5, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(63, _actual);
_actual = [6, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(75, _actual);
_actual = [7, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(88, _actual);
_actual = [15, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(93, _actual);
_actual = [16, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(86, _actual);
_actual = [17, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(79, _actual);
_actual = [18, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(72, _actual);
_actual = [19, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(65, _actual);
_actual = [20, COOPR_STRENGTH_TYPE_SQUAD] call coopr_fnc_strengthAccuracy;
TEXPECT(58, _actual);

TEST("should return 100 for platoon size 15-45");

_actual = [15, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [20, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [25, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [30, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [35, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [40, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [45, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);

TEST("should return decreased accuracy for every offset for platoon size 15-45");

_actual = [50, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(89, _actual);
_actual = [55, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(78, _actual);
_actual = [60, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(67, _actual);
_actual = [70, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(45, _actual);
_actual = [75, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(34, _actual);
_actual = [80, COOPR_STRENGTH_TYPE_PLATOON] call coopr_fnc_strengthAccuracy;
TEXPECT(23, _actual);

TEST("should return 100 for company size 80-150");

_actual = [80, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [90, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [100, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [110, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [120, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [130, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [140, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);
_actual = [150, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(100, _actual);

TEST("should return decreased accuracy for every offset for company size 80-150");

_actual = [155, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(97, _actual);
_actual = [165, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(90, _actual);
_actual = [170, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(87, _actual);
_actual = [200, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(67, _actual);
_actual = [210, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(60, _actual);
_actual = [240, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(40, _actual);
_actual = [250, COOPR_STRENGTH_TYPE_COMPANY] call coopr_fnc_strengthAccuracy;
TEXPECT(34, _actual);

TEND;
