#include "script_component.hpp"
params ["_tempRep"];

_actual = player getVariable [COOPR_KEY_TMP_REPUTATION, 0];
player setVariable [COOPR_KEY_TMP_REPUTATION, _actual + _tempRep];
DEBUG2("updating temp reputation by %1" _tempRep);
