#define DEBUG_CFG [true, true, true]

#define SETUPERROR(var1) [var1, "COOPR.SETUP.ERROR", DEBUG_CFG] call CBA_fnc_debug
#define ERROR(var1) [format ["COOPR.ERROR: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug

#define DEBUG(var1) if (DEBUG_CTX call coopr_fnc_getLogLevel == 2) then { [format ["%1", var1], DEBUG_CTX + ".debug", DEBUG_CFG] call CBA_fnc_debug }
#define INFO(var1) if (DEBUG_CTX call coopr_fnc_getLogLevel >= 1) then { [format ["%1", var1], DEBUG_CTX + ".info", DEBUG_CFG] call CBA_fnc_debug }

#define SLOG(var1) [var1, DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define FLOG(var1,var2) [format [var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define FFLOG(var1,var2,var3) [format [var1, var2, var3], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
