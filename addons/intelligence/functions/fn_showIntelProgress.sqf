
#include "script_component.hpp"

params ["_player", "_clientOwnerId"];

//TODO make show function parameterized (like notification funcs)
private _currentProgess = profileNamespace getVariable [COOPR_CHAR_INTEL_PROGRESS, 0];

[format [localize "str.coopr.intelligence.info.progress", _currentProgess]] remoteExec ["systemChat", _clientOwnerId];
