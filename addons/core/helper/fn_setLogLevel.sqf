#include "script_component.hpp"

params [["_logLevel", -1],["_context", -1]];

if (_logLevel isEqualTo -1) exitWith { SETUPERROR("no log level was defined") };
if (_context isEqualTo -1) exitWith { SETUPERROR("no log context was defined") };

if (isNil "LOG_CONFIG") then {
   LOG_CONFIG = EMPTY_HASH;
};

[LOG_CONFIG, _context, _logLevel] call CBA_fnc_hashSet;

[format ["logging for %1 is now %2", _context, _logLevel], "COOPR.LOGGER", DEBUG_CFG] call CBA_fnc_debug
