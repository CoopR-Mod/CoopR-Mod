#include "..\globals.hpp"

params ["_count"];

private _currentProgress = profileNamespace getVariable [KEY_INTEL_PROGRESS, 0];
private _progressAmount = _count * PROGRESS_PER_ITEM;
private _newProgress = _currentProgress + _progressAmount;

[format ["added %s progress", _progressAmount],DEBUG_STR_INTEL, DEBUG_CFG] call CBA_fnc_debug;

profileNamespace setVariable [KEY_INTEL_PROGRESS, _newProgress];
saveProfilenamespace;
