
#include "script_component.hpp"

params ["_count"];

private _currentProgress = profileNamespace getVariable [COOPR_KEY_INTEL_PROGRESS, 0];
private _progressAmount = _count * PROGRESS_PER_ITEM;
private _newProgress = _currentProgress + _progressAmount;

[format ["added %1 progress", _progressAmount],DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

profileNamespace setVariable [COOPR_KEY_INTEL_PROGRESS, _newProgress];
saveProfileNamespace;
