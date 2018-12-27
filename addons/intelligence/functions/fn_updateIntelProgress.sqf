#include "script_component.hpp"

params ["_count"];

private _currentProgress = profileNamespace getVariable [COOPR_KEY_INTEL_PROGRESS, 0];
private _progressAmount = _count * PROGRESS_PER_ITEM;
private _newProgress = _currentProgress + _progressAmount;

DEBUG2("added %1 progress", _progressAmount);

profileNamespace setVariable [COOPR_KEY_INTEL_PROGRESS, _newProgress];
saveProfileNamespace;
