#include "script_component.hpp"

private _currentReputation = player getVariable [COOPR_KEY_REPUTATION, 0];
private _tempReputation = player getVariable [COOPR_KEY_TMP_REPUTATION, 0];
["ShowReputation", [str _currentReputation, str _tempReputation]] call BIS_fnc_showNotification;
