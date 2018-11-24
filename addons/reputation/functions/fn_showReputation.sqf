#include "script_component.hpp"

params ["_player"];

private _currentReputation = player getVariable [KEY_REPUTATION, 0];
systemChat format ["||Deployed|| Your current reputation is [%1]", _currentReputation];