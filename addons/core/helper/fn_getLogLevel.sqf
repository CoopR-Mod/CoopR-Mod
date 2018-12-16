#include "script_component.hpp"

params [["_context", ""]];

if (_context isEqualTo "") exitWith { SETUPERROR("no log context was defined") };

if (isNil "LOG_CONFIG") then {
    SETUPERROR("log level was not initialized")
};

[LOG_CONFIG, _context ] call CBA_fnc_hashGet;
