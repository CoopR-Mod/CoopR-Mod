#include "..\constants.hpp"
params ["_tempRep"];

_actual = player getVariable [KEY_TMP_REPUTATION, 0];
player setVariable [KEY_TMP_REPUTATION, _actual + _tempRep];
