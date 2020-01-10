#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * Show reputation to the player
 *
 * Scope: Client
 */

private _currentReputation = player getVariable [COOPR_CHAR_REPUTATION, 0];
private _tempReputation = player getVariable [COOPR_CHAR_TMP_REPUTATION, 0];
private _currentInfo = format ["Reputation: %1", _currentReputation];
private _tempInfo = format ["Temp Reputation: %1", _tempReputation];

[[COOPR_LOGO_SMALL], ["Current Reputation:", 1.3, COOPR_BRAND_COLOR], [_currentInfo], [_tempInfo]] call CBA_fnc_notify;
