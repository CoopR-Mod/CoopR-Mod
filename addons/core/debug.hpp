#define DEBUG_CFG [true, true, true]
#define LDEBUG(var1,var2) [format ["DEBUG - %1: %2", var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define DEBUG(var1) [format ["DEBUG: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug

#define ERROR(var1) [format ["COOPR.ERROR: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define SETUPERROR(var1) [format ["COOPR.SETUP.ERROR: %1", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug

#define SLOG(var1) [var1, DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug
#define FLOG(var1,var2) [format [var1, var2], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define FFLOG(var1,var2,var3) [format [var1, var2, var3], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;

#define LSTART(var1) [format ["============= %1 =============", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
#define LEND(var1) [format ["============= /%1 =============", var1], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;


