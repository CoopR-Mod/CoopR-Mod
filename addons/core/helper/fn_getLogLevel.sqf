#include "script_component.hpp"

params [["_context", ""]];

if (_context isEqualTo "") exitWith { SETUPERROR("no log context was defined") };
missionNamespace getVariable ["coopr_log_" + _context, 0];
