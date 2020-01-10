#include "script_component.hpp"

params [["_logLevel", -1],["_context", -1]];

if (_logLevel isEqualTo -1) exitWith { SETUPERROR("no log level was defined") };
if (_context isEqualTo -1) exitWith { SETUPERROR("no log context was defined") };

missionNamespace setVariable ["coopr_log_" + _context, _logLevel];
//[COOPR_LOG_CONFIG, _context, _logLevel] call CBA_fnc_hashSet;

switch _logLevel do {
    case 0: { _logLevel = "None"; };
    case 1: { _logLevel = "Info"; };
    case 2: { _logLevel = "Debug"; };
};

private _machine = "[Client] ";
if (isServer) then { _machine = "[Server] "; };
[format ["%1: %2", _context, _logLevel], _machine + "COOPR.LOGGER", DEBUG_CFG] call CBA_fnc_debug
