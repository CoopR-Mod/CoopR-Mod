#include "script_component.hpp"

private _currentReputation = player getVariable [COOPR_KEY_REPUTATION, 0];
private _tempReputation = player getVariable [COOPR_KEY_TMP_REPUTATION, 0];
private _currentInfo = format ["Reputation: %1", _currentReputation];
private _tempInfo = format ["Temp Reputation: %1", _tempReputation];

[["x\coopr\addons\core\data\images\1x1.paa"],["Current Reputation:", 1.3, COOPR_BRAND_COLOR], [_currentInfo], [_tempInfo]] call CBA_fnc_notify;
