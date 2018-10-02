
#include "..\constants.hpp"

params ["_player", "_clientOwnerId"];

//TODO make show function parameterized (like notification funcs)
private _currentProgess = profileNamespace getVariable [KEY_INTEL_PROGRESS, 0];

[format [localize "str.dpl.intel.info.progress", _currentProgess]] remoteExec ["systemChat", _clientOwnerId];
